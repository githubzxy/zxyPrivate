window.CLOSURE_NO_DEPS = true; (function() {
    var f = !0,
    h = !1;
    function i(a, b, e) {
        this.key = a;
        this.value = b;
        this.g = e
    }
    i.prototype.getKey = function() {
        return this.key
    };
    function n(a, b) {
        if (a == document) return f;
        if (!a || !a.parentNode || 0 === a.offsetWidth || 0 === a.offsetHeight) return h;
        var e = [];
        a.style && e.push(a.style);
        window.getComputedStyle && e.push(window.getComputedStyle(a, ""));
        a.currentStyle && e.push(a.currentStyle);
        for (var c = 0; c < e.length; c++) for (var d = 0; d < b.length; d++) {
            var j = b[d].key;
            if (("opacity" == j ? parseFloat(e[c][j]) : e[c][j]) === b[d].value) return h
        }
        return n(a.parentNode, b)
    }
    function o(a, b) {
        var e = document.getElementById(a),
        c = [{
            key: "visibility",
            value: "hidden"
        },
        {
            key: "display",
            value: "none"
        }];
        b || c.push({
            key: "opacity",
            value: 0
        });
        var d;
        a: {
            d = e.getBoundingClientRect();
            if (d = document.elementFromPoint((d.left + d.right) / 2, (d.top + d.bottom) / 2)) for (; d != document;) {
                if (d == e) {
                    d = f;
                    break a
                }
                d = d.parentNode
            }
            d = h
        }
        return d && n(e, c)
    }
    function p(a) {
        var b, e = a.indexOf("://"),
        c = a.indexOf("?");
        if (0 < e && (0 > c || c > e)) return a;
        b || (b = document.location.href);
        e = b.substring(0, b.indexOf("://") + 3);
        c = b.substring(e.length, b.indexOf("/", e.length + 1));
        0 === a.indexOf("/") ? a = a.split("/") : (b = b.split("?")[0], b = b.substring(e.length + c.length + 1, b.lastIndexOf("/")), a = b.split("/").concat(a.split("/")));
        b = [];
        for (var d = 0; d < a.length; d++) a[d] && "." != a[d] && (".." == a[d] ? b.pop() : b.push(a[d]));
        return e + c + "/" + b.join("/")
    }
    function s(a, b) {
        var e, c;
        for (e in a)"function" == window.jwplayer.utils.typeOf(a.hasOwnProperty) ? a.hasOwnProperty(e) && (c = a[e], b(e, c)) : (c = a[e], b(e, c))
    };
    function t(a) {
        if (window.jwplayer._tracker) return window.jwplayer._tracker;
        window.jwplayer._tracker = this;
        this.b = {};
        this.m = "jwpltx.com";
        this.l = "v1/jwplayer6/ping.gif?";
        this.k = window.jwplayer.version;
        this.j = (this.e = top === self ? 0 : 1) ? document.referrer: window.location.href;
        this.i = document.title;
        this.trackerVersion = 3867;
        this.f = "complete" == document.readyState;
        this.c = [];
        if (this.debug = a) this.d = []
    } (function(a) {
        var b = window.onload;
        window.onload = "function" != typeof window.onload ? a: function() {
            b && b();
            a()
        }
    })(function() {
        var a = window.jwplayer._tracker;
        if (a) {
            for (; 0 < a.c.length;) {
                var b = a.c.shift();
                u(a, b)
            }
            a.f = f
        }
    });
    function v(a, b, e, c) {
        a.b[b] || (a.b[b] = {});
        a.b[b][e] || (a.b[b][e] = {});
        var d = w(a, b, e, c, h);
        a.b[b][e][d] && (d += "&dup=1");
        a.debug && (c = w(a, b, e, c, f), c.url = d, c.h = h, a.d.push(c));
        a.f ? u(a, d) : a.c.push(d);
        a.b[b][e][d] = f
    }
    function w(a, b, e, c, d) {
        b = [new i("tv", a.trackerVersion, 0), new i("n", ("0000000000000000" + Math.random().toString().substring(2)).slice( - 16), 2), new i("aid", b, 4), new i("e", e, 5), new i("i", a.e, 6), new i("pv", a.k, 7), new i("pu", a.j, 8), new i("pt", a.i, 100)];
        0 < c.length && (b = b.concat(c));
        b.sort(function(a, b) {
            return a.g > b.g ? 1 : -1
        });
        if (d) {
            a = {};
            for (c = 0; c < b.length; c++) a[b[c].getKey()] = b[c].value;
            return a
        }
        d = [];
        for (c = 0; c < b.length; c++) d.push(b[c].getKey() + "=" + encodeURIComponent(b[c].value));
        return ["https:" == document.location.protocol ? "https://s.": "http://i.n.", a.m, "/", a.l, d.join("&")].join("")
    }
    function u(a, b) { (new Image).src = b;
        a.debug && s(a.d,
        function(a, c) {
            c.url == b && (c.h = f)
        })
    };
    function x(a) {
        this.a = a
    }
    function A(a, b) {
        a.a.onReady(b)
    }
    function B(a, b) {
        a.a.onIdle(b)
    }
    function C(a, b) {
        a.a.onPlaylistItem(b)
    }
    function D(a, b) {
        a.a.onPlay(b)
    }
    function E(a, b) {
        a.a.onComplete(b)
    }
    function F(a, b) {
        a.a.onTime(b)
    }
    function G(a) {
        return a.a.getRenderingMode()
    }
    function H(a) {
        return a.a.config.autostart ? a.a.config.autostart: h
    };
    function I(a, b) {
        function e(a) {
            var b = g.a.getPlaylistItem(),
            e = c(b);
            v(q, d, "t", [new i("mu", p(e), 18), new i("t", b.title, 19), new i("ed", j, 20), new i("ti", a, 21)])
        }
        function c(a) {
            var b = a.file;
            if (a.sources) {
                for (var b = [], d = a.sources.length - 1; 0 <= d; d--) a.sources[d].file && b.push(a.sources[d].file);
                b.sort();
                b = b[0]
            }
            return b
        }
        if (b.enabled !== h) {
            var d, j = 0,
            k = window.jwplayer.defaults,
            y = k && k.ph ? k.ph: 0,
            k = false;
            b.debug === f && (k = f);
            if (window.jwplayer.key) {
                var z = new window.jwplayer.utils.key(window.jwplayer.key),
                l = z.edition();
                "invalid" != l && (d = z.token());
                j = "invalid" == l ? 4 : "ads" == l ? 3 : "premium" == l ? 2 : "pro" == l ? 1 : 0
            }
            d || (d = "_");
            var m = h,
            r = 0,
            g = new x(a),
            //q = new t(k);
            A(g,
            function() {
                var b = "googima,vast,sharing,jwpsrv,related,gapro".split(","),
                c = "html5" == G(g).toLowerCase(),
                c = [new i("m", "html5" == G(g).toLowerCase() ? 1 : 0, 10), new i("a", "true" == H(g).toString().toLowerCase() ? 1 : 0, 11), new i("v", o(g.a.id, c) ? 1 : 0, 12), new i("w", g.a.getWidth(), 13), new i("h", g.a.getHeight(), 14), new i("ed", j, 20)];
                c.push(new i("ph", y, 1));
                var e = "";
                a.config && a.config.plugins && s(a.config.plugins,
                function(a) {
                    var c = h;
                    s(b,
                    function(b, d) {
                        a.match(RegExp("(/" + d + "(.swf|.js)$)|(^" + d + "$)")) && (c = f)
                    });
                    e && !c && (e += "|");
                    c || (e += a)
                });
                c.push(new i("pn", e, 22));
                //v(q, d, "e", c)
            });
            F(g,
            function(a) {
                a.position && (a = Math.floor(a.position), 29 == r % 30 && 0 == a % 30 && e(30), r = a)
            });
            E(g,
            function() {
                e(r % 30)
            });
            B(g,
            function() {
                m = f
            });
            C(g,
            function() {
                m = f
            });
            D(g,
            function() {
                if (m) {
                    m = h;
                    g.a.getPlaylist();
                    var a = g.a.getPlaylistItem(),
                    b = c(a),
                    a = [new i("m", "html5" == G(g).toLowerCase() ? 1 : 0, 10), new i("a", "true" == H(g).toString().toLowerCase() ? 1 : 0, 11), new i("v", o(g.a.id, h) ? 1 : 0, 12), new i("w", g.a.getWidth(), 13), new i("h", g.a.getHeight(), 14), new i("mu", p(b), 18), new i("t", a.title, 19), new i("ed", j, 20)];
                    a.push(new i("ph", y, 1));
                    v(q, d, "s", a)
                }
            })
        }
    }
    window.jwplayer && window.jwplayer() && window.jwplayer().registerPlugin("jwpsrv", "6.0", I);
})();