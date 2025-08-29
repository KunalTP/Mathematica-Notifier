(* ::Package:: *)
(* :Name: Notifier` *)
(* :Title: A Simple Notification Package for Mathematica *)
(* :Context: Notifier` *)
(* :Author: Your Name *)
(* :Date: 2025-08-29 *)

BeginPackage["Notifier`"];

(* --- Public API --- *)
(* These are the only functions users will interact with. *)

SetNotificationConfig::usage = "SetNotificationConfig[options] sets the credentials for notification services. Options: \"PushoverUserKey\", \"PushoverAPIToken\", \"TelegramBotToken\", \"TelegramChatID\", \"EmailUsername\", \"EmailPassword\", \"EmailRecipient\"";
SendNotification::usage = "SendNotification[message, method] sends a notification. Method can be \"Pushover\", \"Telegram\", or \"Email\".";

Begin["`Private`"];

(* --- Internal storage for credentials --- *)
$Config = <||>;

(* --- Configuration Function --- *)
(* This function securely stores API keys for the current session. *)
Options[SetNotificationConfig] = {
   "PushoverUserKey" -> None, "PushoverAPIToken" -> None,
   "TelegramBotToken" -> None, "TelegramChatID" -> None,
   "EmailUsername" -> None, "EmailPassword" -> None, "EmailRecipient" -> None
   };

SetNotificationConfig[OptionsPattern[]] := Module[{opts},
   opts = FilterRules[{Options[SetNotificationConfig]}, Except[None]];
   $Config = Merge[{($Config), Association[opts]}, Last];
   Print["Notifier configuration updated."];
   ];

(* --- Main Sending Function --- *)
(* This function acts as a dispatcher, calling the correct private function. *)
SendNotification[message_String, method_String] := Switch[method,
   "Pushover", Private`sendPushover[message],
   "Telegram", Private`sendTelegram[message],
   "Email", Private`sendEmail[message],
   _, Message[SendNotification::method, method]
   ];
SendNotification::method = "Unknown notification method `1`. Choose Pushover, Telegram, or Email.";

(* --- Private Helper Functions for each service --- *)

sendPushover[message_] := Module[{user = $Config["PushoverUserKey"], token = $Config["PushoverAPIToken"]},
   If[MissingQ[user] || MissingQ[token], Return[Print["Pushover credentials not set. Use SetNotificationConfig."]]];
   URLSubmit["https://api.pushover.net/1/messages.json", "Body" -> {"token" -> token, "user" -> user, "message" -> message}];
   Print["Pushover notification sent."];
   ];

sendTelegram[message_] := Module[{token = $Config["TelegramBotToken"], chatID = $Config["TelegramChatID"]},
   If[MissingQ[token] || MissingQ[chatID], Return[Print["Telegram credentials not set. Use SetNotificationConfig."]]];
   Quiet@URLRead[HTTPRequest["https://api.telegram.org/bot" <> token <> "/sendMessage", <|"Query" -> {"chat_id" -> chatID, "text" -> message}|>]];
   Print["Telegram notification sent."];
   ];

sendEmail[message_] := Module[{user = $Config["EmailUsername"], pass = $Config["EmailPassword"], recip = $Config["EmailRecipient"]},
   If[MissingQ[user] || MissingQ[pass] || MissingQ[recip], Return[Print["Email credentials not set. Use SetNotificationConfig."]]];
   SendMail[{"To" -> recip, "Subject" -> "Mathematica Evaluation Complete", "Body" -> message}, Server -> "smtp.gmail.com", PortNumber -> 587, "Username" -> user, "Password" -> pass, "EncryptionProtocol" -> "StartTLS"];
   Print["Email notification sent."];
   ];

End[]; (* End `Private` Context *)

EndPackage[];
