events.onEntityTravelToDimension(function(event as crafttweaker.event.EntityTravelToDimensionEvent){
    if(event.dimension != -1) return;
    if(event.entity.dimension != 10) return;
    event.cancel();
});