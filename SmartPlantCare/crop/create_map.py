import folium
#from scipy.spatial import ConvexHull
from flask_babel import _
from .create_polygon import create_polygon
#from .add_points import add_points

###############################################################################
# Function returns a map with the convex hull polygon from the points (LON,LAT tuples)
###############################################################################
def create_map(
    coordinates, layer_name, line_color, fill_color, weight, name
):
    # Map Settings
    map_center = coordinates[0] # First point
    crop_map = folium.Map(location=map_center,
        zoom_start=20,
        tiles="https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}",
        attr = 'Esri',
        name = 'Esri Satellite',
        overlay = False,
        control = True
        )

    # Draw Crop polygon
    crop_polygon = create_polygon(
        crop_map,
        coordinates,
        layer_name=name,
        line_color=line_color,
        fill_color=fill_color,
        weight=weight,
        text=name,
    )

    # Add point with Crop name
    folium.Marker(
        coordinates[0], # First point
        popup=name, # Crop name
        tooltip=_('Click from more information'),
        icon=folium.Icon(color="blue", icon="info-sign"),
    ).add_to(crop_map)

    # Convert map to HTML string
    map_html = crop_map._repr_html_()
    return map_html
