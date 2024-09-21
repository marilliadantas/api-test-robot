<h1 align="center"> BACK-END AUTOMATION - API QA</h1>

![STATUS](https://img.shields.io/static/v1?label=STATUS&message=EM%20CONSTRU%C3%87%C3%83O&color=yellow&style=for-the-badge)


## 💬 About the project
<p> The project seeks to study and improve our knowledge using the <b>Robot Framework</b> for API testing, with the goal of mastering API testing at an advanced level, including response validations, status codes, and integration with other tools.

### 👨‍💻 Programming Language
- [Python](<https://www.python.org/>)


### 💻 Setting Up the Environment
- [Robot Framework](<https://robotframework.org/>)
- [Git](<https://git-scm.com/downloads>)


### 📁 Cloning the Project
```bash
https://github.com/marilliadantas/api-test-robot
```

### 💻 Installing the Robot Framework
```bash
pip install robotframework
```

### 📚 Installing the Recommended Libraries
<h5>*Requests*</h5>

```bash
pip install --upgrade robotframework-requests
```

### ✔️ Running the Tests
Run the tests using the following command, replacing file_name.robot with the name of the file that contains your test cases.
```bash
robot -d logs tests/nome_do_arquivo.robot
```

### ✔️ Running tests with scenario name
Run the tests using the following command, replacing scenario and file_name.robot with the name of the file containing your test cases.
```bash
robot -d logs --test 'CT05: Delete Users' .\tests\users.robot
```
