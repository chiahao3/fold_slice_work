function val = struct_get(s, key, default)
    % 1. Check if 'default' was actually provided
    if nargin < 3
        default = []; % Fallback if no default is specified
    end

    % 2. Check if the field exists
    if isfield(s, key)
        val = s.(key);
        
        % 3. Handle the JSON [] vs {} mismatch
        % If we expect a cell (like for lists) but JSON gave us an empty double
        if iscell(default) && isempty(val) && isnumeric(val)
            val = {}; 
        end
    else
        val = default;
    end
end