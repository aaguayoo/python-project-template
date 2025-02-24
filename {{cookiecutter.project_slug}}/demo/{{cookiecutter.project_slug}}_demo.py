"""{{cookiecutter.project_name.title()}} Streamlit Demo App."""
import streamlit as st
import matplotlib.pyplot as plt
import numpy as np

def main():
    st.set_page_config(page_title="Mi App de Streamlit", layout="wide")
    
    st.sidebar.title("Menú")
    opcion = st.sidebar.selectbox("Selecciona una opción:", ["Inicio", "Gráfica", "Acerca de"])
    
    if opcion == "Inicio":
        st.title("Bienvenido a mi app de Streamlit")
        st.write("Esta es una aplicación de ejemplo usando Streamlit.")
    
    elif opcion == "Gráfica":
        st.title("Gráfico de ejemplo")
        fig, ax = plt.subplots()
        x = np.linspace(0, 10, 100)
        y = np.sin(x)
        ax.plot(x, y)
        st.pyplot(fig)
    
    elif opcion == "Acerca de":
        st.title("Acerca de")
        st.write("Esta aplicación fue creada como una plantilla básica para proyectos en Streamlit.")

if __name__ == "__main__":
    main()

