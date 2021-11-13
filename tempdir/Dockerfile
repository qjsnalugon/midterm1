FROM python
RUN pip install flask
COPY  ./templates /home/myapp/templates/
COPY  design_project.py /home/myapp/
EXPOSE 8080
CMD python3 /home/myapp/design_project.py
