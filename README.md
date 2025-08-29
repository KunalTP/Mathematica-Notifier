# Notifier for Mathematica

A simple Mathematica package to send push notifications to your mobile device when a long evaluation is complete.



Tired of checking if your long calculations are done? This package sends an alert to your phone the moment your script finishes, so you can stop waiting and get back to your work.

## Features
- **Multi-Platform:** Supports **Pushover**, **Telegram**, and **Email** (via Gmail).
- **Easy to Use:** Configure credentials once, then send notifications with a single, clean function.
- **Flexible:** Perfect for monitoring long-running calculations, data analysis, simulations, or exports.

***
## Getting Started

### 1. Installation
The simplest way to use `Notifier` is to place it in your project directory.
1.  Download the `Notifier.wl` file from this repository.
2.  Place the file in the **same directory** as your Mathematica notebook (`.nb`).

> **Pro Tip:** For system-wide access, you can also place `Notifier.wl` in your `$UserBaseDirectory/Applications` folder.

### 2. Configuration: Getting Your Keys
You need to get the required credentials for each service you want to use.

#### 🚀 Pushover
1.  Create an account at [pushover.net](https://pushover.net) and download the app.
2.  Your **User Key** is displayed on the main page after you log in.
3.  Scroll down and click **"Create an Application / API Token"**.
4.  Give your application a name (e.g., "Mathematica") and create it to get an **API Token**.

#### 🤖 Telegram
1.  In the Telegram app, search for the official **`@BotFather`** bot and start a chat.
2.  Send the command `/newbot` and follow the instructions to choose a name and username for your bot.
3.  BotFather will give you your **Bot Token**. Save it.
4.  Find your new bot in Telegram and send it a "hello" message. **This step is required.**
5.  Open a web browser and go to `https://api.telegram.org/bot<YourBOTToken>/getUpdates` (replacing `<YourBOTToken>` with your token).
6.  Look for `"chat":{"id":123456789, ...}`. That number is your personal **Chat ID**.

#### 📧 Email (Gmail)
You must use a 16-character **App Password**, not your regular password.
1.  Go to your Google Account's **Security** tab and ensure **2-Step Verification** is enabled.
2.  On the same page, click on **"App Passwords"**.
3.  Select "Mail" for the app and "Other (Custom name)..." for the device.
4.  Name it "Mathematica" and click **Generate** to get your password.

### 3. Usage in Your Code
See the `Example.nb` notebook in this repository for a live demonstration.

***
## Contributing
Contributions are welcome! Please feel free to open an issue to report a bug, suggest a feature, or submit a pull request.

## License
This project is licensed under the MIT License - see the `LICENSE` file for details.
