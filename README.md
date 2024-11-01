# HXHTMX project

Example showing how one can use Haxe to create a HTMX website. It uses Haxe Hypertext Preprocessor (https://lib.haxe.org/p/hhp/) for templating, hx-http-server as a server (https://github.com/rainyt/hx-http-server/) and TailwindCSS for styling (https://tailwindcss.com/)

I have not been doing web developement for some time, but needed to make a website so looked in to the current options, and wanted something simpler and leaner than frameworks made for advanced client interactivity like React or Next.js.
Looking in the ecosystem of my favourite language, Haxe, there are a couple of decent alternatives like coconut and ufront, but they are staring to show their age and are somewhat complex for my needs. I tried doing HTMX with JSX, TS, Bun, Elysia and TailwindCSS, and found it to be really nice.
And one advantage with HTMX is that all you really need for a language to be suitable is a server and some templating, so I figured I have to try and see if I can get a setup with as good a DX in Haxe as when using TS and JSX, and it certainly seems possible.

First of all I prefer templating where templates are in html format for autocomplete of tags in editor and for allowing tailwind to parse css classes when generating styles. HHP supports parsing html files with Haxe code injected, so gives a very similar developer experience as jsx.
When it comes to choice of server, options are quite limited in the Haxe ecosystem. There are externs for express, but not for more modern solutions like Bun and Hono or Elysia. For a more production ready solution making externs might be a better solution, but I opted for an all-haxe solution with hx-http-server which does basic routing and compiles to Hashlink and cpp.

So why use Haxe instead of TS or Go? In most cases you will probably be better off using a more widespread solution and a more battle tested server, and for a simple website the power Haxe offers with pattern matching, algebraic data types, abstract types and macros will probably not be needed. 
But in my opinion Haxe is a better language to work with than both TS an Go, general DX of this solution is on par with the best and most popular alternatives, and I feel more productive with the smaller and slower moving ecosystem compared to JS/TS.

## Setup

Install Bun (used to manage npm dependencies and running package scripts): `curl -fsSL https://bun.sh/install | bash `
Clone repo: `git clone https://github.com/lbergman/hxhtmx.git`
Enter the cloned repo and run `bun i`
Run `bun run dev` to start server and watcher and open `http://127.0.0.1:3000`in your browser.

## TODO
Add hx-indicators
