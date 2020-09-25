# WasmDump
Dumping ground for WebAssembly scripts

For more information on low-level WebAssembly programming, visit the [Mozilla website](https://developer.mozilla.org/en-US/docs/WebAssembly/Understanding_the_text_format)

## Basics

* [simple.wat](https://github.com/James-P-D/WasmDump/blob/master/src/simple.wat)

## Building and Hosting

To compile a WebAssembly source code file (`.wat`) to a WebAssembly binary file (`.wasm`), we need to use `wat2wasm.exe` which is part of the WebAssembly Binary Toolkit, which can be built from source from [GitHub](https://github.com/WebAssembly/wabt).

I was able to build the executables with the following commands:

```
rem Check value of GIT_EXECUTABLE in CMakeOutput.log
rem GIT_EXECUTABLE:FILEPATH=c:\Users\jdorr\AppData\Local\Programs\Git\mingw64\bin\ in CMakeOutput.log

cd ""C:\Users\jdorr\Desktop\wabt""
md build
cd build
cmake "C:\Users\jdorr\Desktop\wabt" -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=c:\wasm -G "Visual Studio 16 2019" -DBUILD_TESTS=OFF
cmake --build . --config RELEASE --target install
```

If you struggle to build the executables yourself, you can grab the binary files from [here](https://github.com/James-P-D/WasmDump/tree/master/bin).

With the WebAssembly toolkit installed, we can try compiling our first WebAssembly file. Given the file (simple.wat)[https://github.com/James-P-D/WasmDump/blob/master/src/simple.wat] we can compile with the following:

```
wat2wasm.exe simple.wat -o simple.wasm
```

With our `.wasm` file compiled, all we need to do is create the webserver. To create the webserver for actually running our HTML file which contains the Javascript code for calling our WebAssembly functions. First we need to install [node.js](https://nodejs.org/en/download/).

After doing so, we need to use `npm` to install `http-server`

```
npm install http-server
```

Finally we need to start the actual webserver. Simply load the node.js command-prompt in Admin mode, and then run `http-server`, specifying the checked-out folder from our repo:

```
then from node.js command-prompt (admin)
http-server "C:\Users\jdorr\Desktop\Dev\WasmDump\src"
```

We can now go to [http://127.0.0.1:8080/index.html](http://127.0.0.1:8080/index.html) and should see the following:

![Screenshot](https://github.com/James-P-D/WasmDump/blob/master/screenshot.gif)
