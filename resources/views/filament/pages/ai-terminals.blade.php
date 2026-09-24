<x-filament-panels::page>
    <div x-data="{ activeTab: 'core' }" wire:poll.2s>
        
        <!-- Native Filament Tabs -->
        <x-filament::tabs label="Engine Groups">
            <x-filament::tabs.item @click="activeTab = 'core'" alpine-active="activeTab === 'core'">
                Core Engines
            </x-filament::tabs.item>
            <x-filament::tabs.item @click="activeTab = 'ingestion'" alpine-active="activeTab === 'ingestion'">
                Data Ingestion
            </x-filament::tabs.item>
            <x-filament::tabs.item @click="activeTab = 'services'" alpine-active="activeTab === 'services'">
                System Services
            </x-filament::tabs.item>
            <x-filament::tabs.item @click="activeTab = 'binance'" alpine-active="activeTab === 'binance'">
                Binance Copy
            </x-filament::tabs.item>
        </x-filament::tabs>

        <div class="mt-6">
            <!-- Tab 1: Core Engines (Executor + Auditor) -->
            <div x-show="activeTab === 'core'" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 1rem;">
                
                <!-- Terminal Box -->
                <x-filament::section>
                    <x-slot name="heading">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <span>TRADE EXECUTOR & MONITOR (Signals & Exits)</span>
                            <div style="display: flex; gap: 4px;">
                                <div style="width:12px;height:12px;border-radius:50%;background:#ef4444;"></div>
                                <div style="width:12px;height:12px;border-radius:50%;background:#eab308;"></div>
                                <div style="width:12px;height:12px;border-radius:50%;background:#22c55e;"></div>
                            </div>
                        </div>
                    </x-slot>
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['executor'] }}</div>
                    </div>
                </x-filament::section>
                
                <!-- Terminal Box -->
                <x-filament::section>
                    <x-slot name="heading">
                        <div style="display: flex; justify-content: space-between; align-items: center;">
                            <span>TRADE AUDITOR (Gemini Teacher)</span>
                            <div style="display: flex; gap: 4px;">
                                <div style="width:12px;height:12px;border-radius:50%;background:#ef4444;"></div>
                                <div style="width:12px;height:12px;border-radius:50%;background:#eab308;"></div>
                                <div style="width:12px;height:12px;border-radius:50%;background:#22c55e;"></div>
                            </div>
                        </div>
                    </x-slot>
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['auditor'] }}</div>
                    </div>
                </x-filament::section>

            </div>

            <!-- Tab 2: Ingestion -->
            <div x-show="activeTab === 'ingestion'" style="display: none; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 1rem;">
                
                <x-filament::section heading="RSS INGESTOR">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['ingestor'] }}</div>
                    </div>
                </x-filament::section>

                <x-filament::section heading="TELEGRAM INGESTOR">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['telegram'] }}</div>
                    </div>
                </x-filament::section>

                <x-filament::section heading="ON-CHAIN WHALE MONITOR">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['onchain'] }}</div>
                    </div>
                </x-filament::section>

                <x-filament::section heading="CMC MARKET MOVERS">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['cmc'] }}</div>
                    </div>
                </x-filament::section>

            </div>

            <!-- Tab 3: System Services -->
            <div x-show="activeTab === 'services'" style="display: none; grid-template-columns: repeat(auto-fit, minmax(400px, 1fr)); gap: 1rem;">
                
                <x-filament::section heading="AI CLASSIFIER (Ollama)">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['classifier'] }}</div>
                    </div>
                </x-filament::section>

                <x-filament::section heading="LIVE DB BACKUP MANAGER">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 600px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['backup'] }}</div>
                    </div>
                </x-filament::section>

            </div>

            <!-- Tab 4: Binance Copy -->
            <div x-show="activeTab === 'binance'" style="display: none; grid-template-columns: 1fr;">
                
                <x-filament::section heading="BINANCE COPY TRADING MONITOR">
                    <div style="background-color: #111827; color: #4ade80; font-family: monospace; font-size: 0.75rem; padding: 1rem; height: 800px; overflow-y: auto; display: flex; flex-direction: column-reverse; white-space: pre-wrap; border-radius: 0.5rem; word-break: break-word;">
                        <div>{{ $this->logs['binance_copy'] }}</div>
                    </div>
                </x-filament::section>

            </div>
        </div>
    </div>
</x-filament-panels::page>
