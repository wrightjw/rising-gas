%Rising gas simulation

clear all
close all

%Initialise simulation
env = zeros(1000);
imagesc(env);
colormap(copper)
size(env);
[y_len, x_len] = size(env);
n=0;

%Place particles at bottom
for i = 1:1000    
    for j = 900:1000
        env(j,i) = 1;
    end
end

%Motion
while n < 10000
    n = n + 1;
    for x = 1:x_len
        for y = 1:y_len
            if env(y,x) == 1
                
                %Particle motion and store position
                r = floor(5 * rand());
                y_new = y;
                x_new = x;            

                if r == 0
                    y_new = y_new + 1;
                elseif r == 1
                    y_new = y_new - 1;
                elseif r == 2
                    x_new = x_new + 1;
                elseif r == 3
                    x_new = x_new - 1;
                elseif r == 5
                    y_new = y_new + 1;
                end
            
                % Prevent leaving environment or destroying on collision
                if x_new == 0
                    x_new = x_new + 1;
                elseif x_new == x_len + 1
                    x_new = x_new - 1;
                elseif y_new == 0
                    y_new = y_new + 1;
                elseif y_new == y_len + 1
                    y_new = y_new - 1;
                end

                if env(y_new,x_new) == 0
                    env(y,x) = 0;
                    env(y_new,x_new) = 1;
                end
            end
        end
    end

imagesc(env);
pause(0.01);

end
