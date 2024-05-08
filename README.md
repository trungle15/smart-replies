# Smart Reply

This is an implementation of the smart reply features, using LLMs to generate 3 suggestions in a conversation. This implementation is part of the take-home interview for Reffie's Data Science Intern position.

This implementation uses `ollama`, `langchain` and `pydantic` for development.

## Running the notebook
First clone this repo and navigate to the directory:

```sh
git clone git@github.com:trungle15/smart-replies.git
cd smart-replies
```

Ensure that you have Python, `pip` and `jupyter` installed in your system. Unfortunately, Windows is not currently supported for this notebook. If you are using Mac or Linux, simply run the `install_requirements.sh` script:

```bash
chmod +x install_requirements.sh
./install_requirements.sh
```

After installing the requirements, you can run the Jupyter notebook by running:

```bash
jupyter notebook
```

This will open up a browser window with the Jupyter notebook interface. Navigate to the `smart_reply.ipynb` notebook and run the cells in order to see the results.

## Author

👤 **Trung Le**
