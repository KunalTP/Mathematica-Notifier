# Notifier for Mathematica

A simple Mathematica package to send push notifications to your mobile device when a long evaluation is complete.



## Features
- Supports **Pushover**, **Telegram**, and **Email** (via Gmail).
- Simple, clean functions to configure credentials and send messages.
- Perfect for monitoring long-running calculations, data analysis, or simulations. 🧑‍🔬

---

## Installation
1.  Download the `Notifier.wl` file.
2.  Place `Notifier.wl` in the same directory as your Mathematica notebook (`.nb` file).

---

## Getting Your Credentials
Before you can send notifications, you'll need to get the right keys and tokens for the service you want to use.

### 🔔 Pushover
You'll need a **User Key** and an **API Token**.

1.  **User Key**: After you sign up for a [Pushover account](https://pushover.net), your **User Key** is displayed right on your main dashboard.
2.  **API Token**:
    * On the Pushover site, go to the **Your Applications** section and click **Create an Application/API Token**.
    * Fill out the form (you can name it "Mathematica Notifier").
    * After creating the application, the site will give you your **API Token**.

### ✈️ Telegram
You'll need a **Bot Token** and a **Chat ID**.

1.  **Bot Token**:
    * Open your Telegram app and search for the official bot manager, `@BotFather`.
    * Start a chat and send the command `/newbot`.
    * Follow the prompts to name your new bot. BotFather will reply with your unique **Bot Token**.
2.  **Chat ID**:
    * The easiest way to find your ID is to search for the bot `@userinfobot`.
    * Start a chat with it, and it will immediately reply with your user information, including your numerical **Chat ID**.

### 📧 Gmail (Email)
To send emails using Gmail, you must use an **App Password**. This is a special 16-character password that gives an app permission to access your Google Account. To create one, you first need to enable 2-Step Verification.

1.  **Enable 2-Step Verification**: Go to your [Google Account's Security settings](https://myaccount.google.com/security) and turn on **2-Step Verification**.
2.  **Generate App Password**:
    * In the same Security settings page, find and click on **App passwords**.
    * When prompted, select "Mail" for the app and "Other (Custom name)" for the device.
    * Give it a name you'll recognize, like "Mathematica Notifier", and click **Generate**.
    * Google will show you a **16-character password**. Copy this password (without the spaces) and use it for the `EmailPassword` setting. **Do not use your regular Gmail password.**

---

## Usage

### 1. Load the Package
First, make sure your Mathematica notebook is saved in the same directory as the `Notifier.wl` package file.

```mathematica
(* Sets the working directory to where your notebook is located *)
SetDirectory[NotebookDirectory[]];

(* Loads the package *)
Needs["Notifier`"];
### 2. Configure Credentials
Use the `SetNotificationConfig` function to set up the services you want to use. You only need to do this once per session.Just fill in the credentials you obtained in the steps above.

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
---

## Example

An example notebook demonstrating the package's functionality is available.

* **[View the example as a PDF](Example.pdf)** (Recommended for a quick look)
* **[Download the interactive notebook](Example.nb)** (Right-click and select "Save Link As...")

---
```

## License
This project is licensed under the MIT License - see the `LICENSE` file for details.
