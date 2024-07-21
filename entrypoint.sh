#!/bin/bash

# Check if database is empty, if so, copy the init files

echo "Docker volume initialization checking"
if [ -z "$(ls -A /home/data/dbs)" ]; then
	cp -r /home/init/* /home/data/dbs
	echo "Docker volume initialization completed"
else
	echo "Docker volume already initialized"
fi


# Start the streamlit app
echo "Starting meme search service"
streamlit run /home/meme_search/app.py --server.port=8501 --server.address=0.0.0.0