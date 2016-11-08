var _ = {};

_.w = function(a) {
        return a ? a.length : 0
    }
   
_.E = function(a, b, c) {
        if (a && (void 0 !== a.lat || void 0 !== a.lng))
            try {
                Ub(a),
                b = a.lng,
                a = a.lat,
                c = !1
            } catch (d) {
                _.Gb(d)
            }
        a -= 0;
        b -= 0;
        c || (a = _.Za(a, -90, 90),
        180 != b && (b = _.$a(b, -180, 180)));
        this.lat = function() {
            return a
        };
        this.lng = function() {
            return b
        }
    }

_.Gb = function(a) {
        if (!(a instanceof Eb))
            throw a;
        _.kb(a.name + ": " + a.message)
    }
    
_.Za = function(a, b, c) {
        null != b && (a = Math.max(a, b));
        null != c && (a = Math.min(a, c));
        return a
    }

_.$a = function(a, b, c) {
        c -= b;
        return ((a - b) % c + c) % c + b
    }

_.kb = function(a) {
        window.console && window.console.error && window.console.error(a)
    }
    
var decodePath = function(a) {
    for (var b = _.w(a), c = Array(Math.floor(a.length / 2)), d = 0, e = 0, f = 0, g = 0; d < b; ++g) {
        var h = 1, l = 0, n;
        do
            n = a.charCodeAt(d++) - 63 - 1,
            h += n << l,
            l += 5;
        while (31 <= n);
        e += h & 1 ? ~(h >> 1) : h >> 1;
        h = 1;
        l = 0;
        do
            n = a.charCodeAt(d++) - 63 - 1,
            h += n << l,
            l += 5;
        while (31 <= n);f += h & 1 ? ~(h >> 1) : h >> 1;
        c[g] = new _.E(1E-5 * e,1E-5 * f,!0)
    }
    c.length = g;
    var coord = [];
    for(var i = 0;i < c.length;i++){
        var temp = {
        lat: c[i].lat(),
        lng: c[i].lng()
        };
        coord.push(temp);
    }
    return coord;
}

var decodeCord = function(b){
    a = b[0];
    var coord = [];
    for(var i = 0;i < a.length;i++){
        var temp = {
            lat: a[i].lat(),
            lng: a[i].lng()
        };
        coord.push(temp);
    }
    return coord;
}
