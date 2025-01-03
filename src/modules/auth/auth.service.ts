import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import * as bcrypt from 'bcrypt';
import { LoginDto, RegisterDto } from './dto/auth.dto';
import { UserService } from '../user/user.service';

@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UserService,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
  ) {}

  async register(registerDto: RegisterDto) {
    const { password, ...userData } = registerDto;
    const hashedPassword = await bcrypt.hash(password, 10);
    
    const user = await this.userService.create({
      ...userData,
      password: hashedPassword,
    });

    const token = this.generateToken(user);
    return { user, token };
  }

  async login(loginDto: LoginDto) {
    const user = await this.userService.findByEmail(loginDto.email);
    if (!user) {
      throw new UnauthorizedException('Invalid credentials');
    }

    const isPasswordValid = await bcrypt.compare(loginDto.password, user.password);
    if (!isPasswordValid) {
      throw new UnauthorizedException('Invalid credentials');
    }

    if (user.twoFactorEnabled && !loginDto.twoFactorCode) {
      return { requiresTwoFactor: true };
    }

    if (user.twoFactorEnabled) {
      const isTwoFactorValid = await this.verifyTwoFactorCode(
        user.id,
        loginDto.twoFactorCode,
      );
      if (!isTwoFactorValid) {
        throw new UnauthorizedException('Invalid 2FA code');
      }
    }

    const token = this.generateToken(user);
    return { user, token };
  }

  async getProfile() {
    // Implementation depends on how you store the current user
    return { message: 'Profile endpoint' };
  }

  async enable2FA() {
    // Implementation for enabling 2FA
    return { message: '2FA endpoint' };
  }

  private generateToken(user: any) {
    const payload = { 
      sub: user.id,
      email: user.email,
    };
    
    return this.jwtService.sign(payload);
  }

  private async verifyTwoFactorCode(userId: string, code: string): Promise<boolean> {
    // Implementation for 2FA verification
    return true;
  }
}
