import folium

def add_points(map_object, list_of_points, layer_name, line_color, fill_color, text):
    """
    Function to draw points in the map
    """
    fg = folium.FeatureGroup(name=layer_name)

    for point in list_of_points:
        fg.add_child(
            folium.CircleMarker(
                point,
                radius=1,
                color=line_color,
                fill_color=fill_color,
                popup=(folium.Popup(text)),
            )
        )

    map_object.add_child(fg)