<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use App\Models\Signal;
use App\Models\Source;
use Carbon\Carbon;

class TradingViewWebhookController extends Controller
{
    public function handle(Request $request)
    {
        // Require JSON payload
        if (!$request->isJson()) {
            return response()->json(['error' => 'Payload must be JSON'], 400);
        }

        $data = $request->json()->all();

        // Security check
        $validPassphrase = env('TRADINGVIEW_PASSPHRASE', 'cryptrader_secure_123');
        if (!isset($data['passphrase']) || $data['passphrase'] !== $validPassphrase) {
            Log::warning('Unauthorized TradingView webhook attempt', ['ip' => $request->ip()]);
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Validate required fields
        if (!isset($data['asset']) || !isset($data['action'])) {
            return response()->json(['error' => 'Missing required fields: asset, action'], 400);
        }

        // Ensure Source exists
        $source = Source::firstOrCreate(
            ['type' => 'webhook', 'name' => 'TradingView'],
            ['status' => 'active', 'historical_win_rate' => 0.80]
        );

        $action = strtoupper($data['action']);
        if (!in_array($action, ['BUY', 'SELL', 'HOLD'])) {
            $action = 'HOLD';
        }

        $sentiment = isset($data['sentiment']) ? (float)$data['sentiment'] : ($action === 'BUY' ? 8.0 : 2.0);
        $rawText = $data['raw_text'] ?? "TradingView Automated Strategy Alert for {$data['asset']} ({$action})";

        // Create the signal
        $signal = new Signal();
        $signal->source_id = $source->id;
        $signal->raw_text = $rawText;
        $signal->parsed_sentiment = $sentiment;
        $signal->asset = strtoupper($data['asset']);
        // Send directly to 'pending' if actionable
        $signal->status = ($action === 'BUY') ? 'pending' : 'processed';
        $signal->created_at = Carbon::now();
        $signal->save();

        Log::info("TradingView Signal Processed: {$action} {$data['asset']}");

        return response()->json([
            'status' => 'success',
            'message' => 'Signal recorded successfully',
            'signal_id' => $signal->id
        ], 200);
    }
}
