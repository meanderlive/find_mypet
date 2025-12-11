package com.example.findmypet.findmypet.auth;

import com.example.findmypet.findmypet.auth.dto.AuthResponse;
import com.example.findmypet.findmypet.auth.dto.LoginRequest;
import com.example.findmypet.findmypet.auth.dto.RegisterRequest;
import com.example.findmypet.findmypet.users.User;
import com.example.findmypet.findmypet.users.UserService;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

@Service
public class AuthService {
    private final UserService userService;
    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;

    public AuthService(UserService userService, AuthenticationManager authenticationManager, JwtService jwtService) {
        this.userService = userService;
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
    }

    public AuthResponse register(RegisterRequest request) {
        User user = userService.createUser(request.getName(), request.getEmail(), request.getPassword());
        String token = jwtService.generateToken(user.getEmail());
        return new AuthResponse(token);
    }

    public AuthResponse login(LoginRequest request) {
        authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        String token = jwtService.generateToken(request.getEmail());
        return new AuthResponse(token);
    }
}


