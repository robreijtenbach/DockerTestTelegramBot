from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes

try:
    with open("token.txt") as f:
        BOT_TOKEN = 'YOUR_BOT_TOKEN_HERE'
except FileNotFoundError:
    print("File not found.")
    exit(1)


# Define a start command handler
async def start(update: Update, context: ContextTypes.DEFAULT_TYPE):
    await update.message.reply_text("Hello! I'm your bot.")

# Run the bot
async def main():
    app = ApplicationBuilder().token(BOT_TOKEN).build()

    # Register the /start command
    app.add_handler(CommandHandler("start", start))

    print("Bot is running...")
    await app.run_polling()

# Entry point
if __name__ == '__main__':
    import asyncio
    asyncio.run(main())