<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TradingViewWebhookController;

Route::post('/webhooks/tradingview', [TradingViewWebhookController::class, 'handle']);
