#!/usr/bin/env python3


import ollama
import os

# --- Configuration ---
# CRITICAL: Use your HTTPS domain/port for the remote Windows server
OLLAMA_SERVER_URL = "https://ollama.ldmathes.cc:11434"  # Include port 11434 if necessary for your setup
IMAGE_PATH = "./sample_image.jpg"  # Change this to the path of your image file
PROMPT = "Describe this image in detail and tell me if it contains any text."
MODEL_NAME = "llava:latest"
# ---------------------

def run_llava_remotely():
    """
    Connects to the remote Ollama server and sends an image to LLaVA.
    """
    if not os.path.exists(IMAGE_PATH):
        print(f"Error: Image file not found at {IMAGE_PATH}")
        print("Please ensure you have an image file at that location.")
        return

    try:
        # Initialize the client, pointing it to your remote server URL
        client = ollama.Client(host=OLLAMA_SERVER_URL)
        
        # Read the image file as binary data
        with open(IMAGE_PATH, 'rb') as img_file:
            image_data = img_file.read()

        print(f"Sending request for model: {MODEL_NAME} to {OLLAMA_SERVER_URL}...")
        
        # Send the chat request. The 'images' key handles the multimodal data.
        response = client.chat(
            model=MODEL_NAME,
            messages=[
                {
                    'role': 'user',
                    'content': PROMPT,
                    'images': [image_data],  # Pass the raw binary image data
                },
            ],
            stream=False # Set to True for streaming responses
        )

        print("\n--- LLaVA Response ---")
        print(response['message']['content'])
        print("----------------------\n")

    except Exception as e:
        print(f"\nAn error occurred while connecting or running the model:")
        print(f"Ensure the Windows host is running, {OLLAMA_SERVER_URL} is correct, and the host's firewall is open.")
        print(f"Error details: {e}")

if __name__ == "__main__":
    run_llava_remotely()
