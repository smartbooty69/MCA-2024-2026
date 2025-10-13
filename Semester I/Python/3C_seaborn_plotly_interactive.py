import seaborn as sns
import plotly.express as px


data = sns.load_dataset("iris")


def main():
    fig = px.scatter(
        data_frame=data,
        x='sepal_length',
        y='sepal_width',
        color='species',
        title="Interactive Scatter Plot of Iris Dataset",
    )
    fig.show()


if __name__ == "__main__":
    main()


