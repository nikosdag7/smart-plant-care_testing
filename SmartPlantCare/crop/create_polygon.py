import folium
from scipy.spatial import ConvexHull

def create_polygon(
    map_object, list_of_points, layer_name, line_color, fill_color, weight, text
):
    """
    Creates a polygonal ConvexHull shape from a list of points.
    Function that takes a map and a list of points (LON,LAT tuples) and
    returns a map with the convex hull polygon from the points as a new layer
    :param points: list of points [[x1, y1], [x2, y2], ...]
    """
    # Since it is pointless to draw a convex hull polygon around less than 3 points check len of input
    if len(list_of_points) < 3:
        return 

    # Create the convex hull using scipy.spatial
    form = [list_of_points[i] for i in ConvexHull(list_of_points).vertices]

    # Create feature group, add the polygon and add the feature group to the map
    fg = folium.FeatureGroup(name=layer_name)
    fg.add_child(
        folium.vector_layers.Polygon(
            locations=form,
            color=line_color,
            fill_color=fill_color,
            weight=weight,
            popup=(folium.Popup(text)),
        )
    )
    map_object.add_child(fg)

    return map_object