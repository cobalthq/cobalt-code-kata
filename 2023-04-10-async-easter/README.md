# The Secure Environment Variable Holder and Exporter

This story is written with the help of ChatGPT:

> In the fictional city of Cybersafe, a renowned cybersecurity company,
> «EnviroSec», is developing a secure environment variable holder and exporter.
> This tool will store sensitive tokens, such as API keys and access tokens,
> ensuring that they are not exposed in the environment by default. To ensure
> the tool's security, «EnviroSec» is inviting engineers to solve various
> challenges related to creating and maintaining this secure environment
> variable holder and exporter.

The task is to create or describe how you use a tool to safely store your tokens.
Of course you can just put them in your shell environment from the start but
if you have a high level of access or need different tokens for different tasks,
you need a way to export sensitive environment variables on demand and then just
close the terminal.

You can use any tool or CLI. You can write your own. Be mindful that this is
a public repository. We have at least two or three ways to export sensitive
environment variables described in our docs and chats.

Create a folder with your name of github handle in this folder and add
the program or a snippet. Document how adding and rotating key-value pairs would
look like.
