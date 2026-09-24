with open("Y:/cryptrader/ai_workers/executor.log", "r", encoding="utf-8") as f:
    lines = f.readlines()
    for line in lines[-40:]:
        print(line.strip().encode('ascii', 'ignore').decode())
