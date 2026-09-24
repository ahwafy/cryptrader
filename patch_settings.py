with open('Y:/cryptrader/app/Filament/Pages/SystemSettings.php', 'r', encoding='utf-8') as f:
    content = f.read()

# Add to mount
mount_target = """            'last_heartbeat_auditor' => $settings['last_heartbeat_auditor'] ?? 'Never',
        ]);"""
mount_replace = """            'last_heartbeat_auditor' => $settings['last_heartbeat_auditor'] ?? 'Never',
            
            'auto_blocklist_hours' => $settings['auto_blocklist_hours'] ?? '24',
            'auto_blocklist_consecutive_losses' => $settings['auto_blocklist_consecutive_losses'] ?? '2',
            'auto_blocklist_max_loss_amount' => $settings['auto_blocklist_max_loss_amount'] ?? '50',
        ]);"""

if 'auto_blocklist_hours' not in content:
    content = content.replace(mount_target, mount_replace)

form_target = """                                        Select::make('max_futures_leverage')
                                            ->label('Max Futures Leverage')
                                            ->options([
                                                '1' => '1x (No Leverage)',
                                                '2' => '2x',
                                                '3' => '3x',
                                                '4' => '4x',
                                                '5' => '5x (Safe Cap)',
                                                '10' => '10x',
                                                '20' => '20x',
                                            ])
                                            ->required(),
                                    ])
                                ])
                            ]),"""

form_replace = """                                        Select::make('max_futures_leverage')
                                            ->label('Max Futures Leverage')
                                            ->options([
                                                '1' => '1x (No Leverage)',
                                                '2' => '2x',
                                                '3' => '3x',
                                                '4' => '4x',
                                                '5' => '5x (Safe Cap)',
                                                '10' => '10x',
                                                '20' => '20x',
                                            ])
                                            ->required(),
                                    ]),
                                Section::make('Asset Cooldown (Auto-Blocklist)')->schema([
                                    Grid::make(3)->schema([
                                        TextInput::make('auto_blocklist_hours')
                                            ->label('Cooldown Duration (Hours)')
                                            ->helperText('How long a coin is blocked. 0 to disable.')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('auto_blocklist_consecutive_losses')
                                            ->label('Consecutive Losses Threshold')
                                            ->helperText('Auto-block if coin loses this many times in a row.')
                                            ->numeric()
                                            ->required(),
                                        TextInput::make('auto_blocklist_max_loss_amount')
                                            ->label('Max Single Loss Amount ($)')
                                            ->helperText('Auto-block immediately if a single trade loses more than this.')
                                            ->numeric()
                                            ->required(),
                                    ])
                                ])
                            ]),"""

content = content.replace(form_target, form_replace)

with open('Y:/cryptrader/app/Filament/Pages/SystemSettings.php', 'w', encoding='utf-8') as f:
    f.write(content)

print("SystemSettings.php patched successfully.")
