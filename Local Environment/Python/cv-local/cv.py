import cv2
import dlib
import numpy as np

# Load a pre-trained face detection model (Haar Cascade)
face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')

# Load a pre-trained face recognition model (dlib)
face_recognizer = dlib.face_recognition_model_v1("shape_predictor_68_face_landmarks.dat")

# Load stored images and their corresponding labels
stored_images = {
    "Saklayen": dlib.load_rgb_image("33430.jpg"),
    "Mozumder": dlib.load_rgb_image("32949.jpg"),
    # Add more stored images here
}

# Extract and store face encodings for stored images
stored_encodings = {}
for label, image in stored_images.items():
    face_locations = face_cascade.detectMultiScale(image, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))
    if len(face_locations) == 1:
        landmarks = dlib.shape_predictor("shape_predictor_68_face_landmarks.dat")(image, face_locations[0])
        face_encoding = face_recognizer.compute_face_descriptor(image, landmarks)
        stored_encodings[label] = face_encoding

# Initialize the camera
camera = cv2.VideoCapture(0)

while True:
    ret, frame = camera.read()

    if not ret:
        break

    # Detect faces in the current frame
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    for (x, y, w, h) in faces:
        face = frame[y:y+h, x:x+w]
        
        # Compute face encoding for the detected face
        landmarks = dlib.shape_predictor("shape_predictor_68_face_landmarks.dat")(frame, dlib.rectangle(x, y, x+w, y+h))
        face_encoding = face_recognizer.compute_face_descriptor(frame, landmarks)

        # Compare the face encoding to stored encodings
        matched_label = "Unknown"
        min_distance = float("inf")
        for label, stored_encoding in stored_encodings.items():
            distance = np.linalg.norm(np.array(face_encoding) - np.array(stored_encoding))
            if distance < min_distance:
                min_distance = distance
                matched_label = label

        # Draw a rectangle and label on the face in the frame
        cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)
        cv2.putText(frame, matched_label, (x, y - 10), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

        # Check if the face matches any stored image and display the name
        if matched_label != "Unknown":
            cv2.putText(frame, f"Matched: {matched_label}", (x, y - 35), cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0, 255, 0), 2)

    # Display the frame
    cv2.imshow('Face Recognition', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera and close all OpenCV windows
camera.release()
cv2.destroyAllWindows()
