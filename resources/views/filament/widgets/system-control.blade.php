<x-filament-widgets::widget>
    <x-filament::section>
        <x-slot name="heading">
            System Operational Control
        </x-slot>

        <x-slot name="description">
            Global toggle for AI Workers and Trade Execution engines.
        </x-slot>

        <div class="flex flex-col items-center justify-center gap-6">
            @php
                $status = $this->getSystemStatus();
                $color = match($status) {
                    'RUNNING' => 'success',
                    'EMERGENCY STOPPED' => 'danger',
                    default => 'warning'
                };
            @endphp
            
            <div class="flex items-center gap-2">
                <span class="text-sm font-medium text-gray-500 uppercase tracking-wider">System State:</span>
                <x-filament::badge :color="$color" size="lg">
                    {{ $status }}
                </x-filament::badge>
            </div>

            <div class="flex flex-wrap items-center justify-center gap-4">
                {{ $this->startAllAction }}
                
                {{ $this->stopAllAction }}
                
                {{ $this->emergencyStopAction }}
            </div>
        </div>
    </x-filament::section>
</x-filament-widgets::widget>
