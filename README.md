# Monitor System

This Bash script monitors a specified folder (and its subfolders) for real-time changes, including:

- File creation 🟢
- File modification 🟡
- File deletion 🔴

All events are logged with timestamps and displayed in color-coded output in the terminal.

---

## 📸 Sample Output

![Sample Output](https://ik.imagekit.io/rxwmlctqp/Screenshot%20From%202025-06-28%2023-44-28.png?updatedAt=1751135017704)

> ✨ Above: Terminal output showing real-time tracking of file events.

---

## ⚙️ Features

- 📌 Real-time monitoring using `inotifywait`
- 📋 Logs events with full timestamps and file paths
- 🎨 Color-coded terminal output
- 🔁 Ignores its own log file to prevent event loops
- 📂 Recursively monitors subdirectories

---

## 🧩 Requirements

Make sure `inotify-tools` is installed:

```bash
# Debian/Ubuntu
sudo apt install inotify-tools

# Fedora
sudo dnf install inotify-tools

# Arch
sudo pacman -S inotify-tools

# macOS (via Homebrew)
brew install inotify-tools
````

---

## 🚀 Usage

1. Clone or download this repository.
2. Make the script executable:

   ```bash
   chmod +x file_watcher.sh
   ```
3. Run the script:

   ```bash
   ./file_watcher.sh
   ```

By default, it monitors `~/Documents/Bash Scripting` and logs to `MonitorLogs.txt`.

---

## 📝 Configuration

You can change the **watched folder** and **log file** inside the script:

```bash
WatchedFolder=FolderPath_to_monitor
LogFile=FilePath_where_log_file_to_store
```

Make sure to use `realpath` to resolve full paths and avoid issues with `~`.

---

---

## 🛡️ Notes

* 🧠 Avoid placing the log file inside the watched folder to prevent feedback loops — or use the built-in filtering.
* 🕵️‍♂️ Script uses `realpath` to compare absolute paths reliably.
* Works best on Linux systems with `inotifywait`.

---

## Contact

For any question or doubts, please open an issue in the [Git Repo](https://github.com/Its-Vaibhav-2005/Monitor-System/issues)
