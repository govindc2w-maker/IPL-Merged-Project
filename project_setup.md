# Python Project Setup Guide

Follow these steps to install and run the project on Windows.

## Step 1: Download the project

Download the project from the GitHub link and unzip the downloaded file.

[GitHub Project Link](https://github.com/govindc2w-maker/IPL-Merged-Project)

## Step 2: Check your Python version

Open Command Prompt or the VS Code terminal and run:

``` bash
python --version
```

Make sure Python **3.12** is installed. If it is not, download it from
the official Python website:

[Download Python 3.12](https://www.python.org/downloads/release/python-3120/)

## Step 3: Open the project in VS Code

Launch Visual Studio Code and open the extracted project directory.

## Step 4: Create a virtual environment

In the project directory, create a virtual environment using Python
3.12:

``` bash
py -3.12 -m venv .venv
```

## Step 5: Activate the virtual environment

In the VS Code terminal on Windows, run:

``` powershell
.venv\Scripts\activate
```

## Step 6: Install required libraries

Install the project dependencies:

``` bash
pip install -r requirements.txt
```

## Step 7: Run the project

Start the Streamlit application:

``` bash
streamlit run ./home.py
```

