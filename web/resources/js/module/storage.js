class Storage {

    static get(key) {
        let value = localStorage.getItem(key);
        if (value === null) {
            return null;
        } else {
            let parse_value = JSON.parse(value);
            if (60 * 60 * 24 * 1000 < new Date().getTime() - (JSON.parse(parse_value).date * 1)) {
                this.clear();
            } else {
                return parse_value;
            }
        }
    }

    static set(key, value) {
        return localStorage.setItem(key, JSON.stringify(value));
    }

    static unset(key) {
        if (this.isset(key))
            return localStorage.removeItem(key);
        else
            return null;
    }

    static clear() {
        return localStorage.clear();
    }

    static isset(key) {
        return this.get(key) !== null;
    }

}