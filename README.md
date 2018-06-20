# BigText

![That was huge](https://media.giphy.com/media/drUQaRAxnTL4Q/giphy.gif)

**A tool to very easily convert text into letter emojis for writing giant text
in Slack.**

## Installation

You can install BigText by running the following command in your terminal:
```bash
sudo curl -L -o /usr/local/bin/bigtext https://github.com/dnsbty/big_text/releases/download/latest/big_text ; sudo chmod +x /usr/local/bin/bigtext
```

## Development

BigText is written as an Escript in Elixir. In order to run it, you will need to have Elixir and Erlang installed.

## Building

To build BigText, run
```bash
mix escript.build
```

You can then run BigText with
```bash
./big_text whatever you want to convert
```
