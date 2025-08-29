# Notifier for Mathematica

A simple Mathematica package to send push notifications to your mobile device when a long evaluation is complete.



## Features
- Supports **Pushover**, **Telegram**, and **Email** (via Gmail).
- Simple, clean functions to configure credentials and send messages.
- Perfect for monitoring long-running calculations, data analysis, or simulations.

## Installation
1.  Download the `Notifier.wl` file from this repository.
2.  Place `Notifier.wl` in the same directory as your Mathematica notebook (`.nb` file).

## Usage

### 1. Load the Package
Make sure your notebook is in the same directory as the package file.

```mathematica
SetDirectory[NotebookDirectory[]];
Needs["Notifier`"];
```

### 2. Configure Credentials
Use the `SetNotificationConfig` function to set up the services you want to use. You only need to do this once per session.

```mathematica
SetNotificationConfig[
  (* For Pushover *)
  "PushoverUserKey" -> "YOUR_PUSHOVER_USER_KEY",
  "PushoverAPIToken" -> "YOUR_PUSHOVER_API_TOKEN",

  (* For Telegram *)
  "TelegramBotToken" -> "YOUR_TELEGRAM_BOT_TOKEN",
  "TelegramChatID" -> "YOUR_TELEGRAM_CHAT_ID",

  (* For Email (using a Gmail App Password) *)
  "EmailUsername" -> "your.email@gmail.com",
  "EmailPassword" -> "your-16-character-app-password",
  "EmailRecipient" -> "recipient.email@example.com"
];
```

### 3. Send a Notification
Use `SendNotification` at the end of a long calculation.

```mathematica
(* Run your long calculation *)
timing = AbsoluteTiming[
   Pause[10]; (* Represents a long task *)
   result = "Simulation finished successfully.";
];

(* Send the notification *)
SendNotification[
  "Task complete in " <> ToString[Round[timing[[1]]]] <> "s. " <> result, 
  "Telegram"
]
```

## License
This project is licensed under the MIT License - see the `LICENSE` file for details.
