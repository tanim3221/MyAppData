import csv
import os
import time
from datetime import datetime

import openpyxl
import pandas as pd
import PyPDF2
from colorama import Back, Style
from django.conf import settings
from django.contrib import messages
from django.http import HttpResponse
from django.shortcuts import redirect, render
from openpyxl import load_workbook
from PIL import Image
from PyPDF2 import PdfMerger
from reportlab.lib.pagesizes import A4, letter
from reportlab.pdfgen import canvas

from .forms import UploadFileForm
from .models import Upload


def upload_file(request):
    if request.method == 'POST':
        form = UploadFileForm(request.FILES)
        if form.is_valid():
            instance = form.save()
            image_path = instance.file.path
            image_paths = [image_path]
            relative_pdf_path = jpgtopdf(image_paths)
            context = {
                'pdf_path': relative_pdf_path,
                'message': 'Successfully uploaded and converted to PDF!',
                'MEDIA_URL': settings.MEDIA_URL
            }
            
            return render(request, 'home.html', context)
            
    else:
        form = UploadFileForm()
    return render(request, 'home.html', {'form': form})


def jpgtopdf(image_paths):
    curr_time = datetime.now().strftime("%Y%m%d%H%M%S")

    if not image_paths:
        return None

    # Assuming all images are in the same directory
    input_folder = os.path.dirname(image_paths[0])

    # Output PDF file name based on the current timestamp
    pdf_output = os.path.join(input_folder, "converted_" + curr_time + ".pdf")

    # Create a PDF using ReportLab
    c = canvas.Canvas(pdf_output, pagesize=letter)

    for image_path in image_paths:
        image = Image.open(image_path)
        image_width, image_height = image.size

        if image_width < A4[0] and image_height < A4[1]:
            page_size = A4
        else:
            page_size = (image_width, image_height)

        c.setPageSize(page_size)
        c.drawImage(image_path, 0, 0, width=image_width, height=image_height, preserveAspectRatio=True, anchor='nw')
        c.showPage()

    c.save()

    relative_path = os.path.relpath(pdf_output, settings.MEDIA_ROOT)
    return relative_path
