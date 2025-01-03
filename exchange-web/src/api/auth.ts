import axios, { AxiosError } from 'axios';
import type { User } from '../types/user';

const api = axios.create({
  baseURL: 'http://localhost:1212'
});

// 请求拦截器添加 token
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

// 响应拦截器处理错误
api.interceptors.response.use(
  response => response,
  (error: AxiosError) => {
    if (error.response) {
      const { data, status } = error.response;
      
      // 处理特定状态码
      switch (status) {
        case 400:
          throw new Error((data as any).message || '请求参数错误');
        case 401:
          throw new Error('未授权，请重新登录');
        case 403:
          throw new Error('没有权限执行此操作');
        case 404:
          throw new Error('请求的资源不存在');
        case 409:
          throw new Error('邮箱已被注册');
        case 500:
          throw new Error('服务器错误，请稍后重试');
        default:
          throw new Error('未知错误，请稍后重试');
      }
    }
    throw new Error('网络错误，请检查您的网络连接');
  }
);

interface AuthResponse {
  token: string;
  user: User;
}

interface RegisterData {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
}

export async function login(email: string, password: string): Promise<AuthResponse> {
  try {
    const { data } = await api.post('/auth/login', { email, password });
    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('登录失败，请重试');
  }
}

export async function register(data: RegisterData): Promise<AuthResponse> {
  try {
    const { data } = await api.post('/auth/register', data);
    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('注册失败，请重试');
  }
}

export async function enable2FA(): Promise<{ qrCode: string; secret: string }> {
  try {
    const { data } = await api.post('/auth/enable2fa');
    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('开启双重认证失败，请重试');
  }
}

export async function verify2FA(code: string): Promise<{ success: boolean }> {
  try {
    const { data } = await api.post('/auth/verify2fa', { code });
    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('验证码验证失败，请重试');
  }
}

export async function getProfile(): Promise<User> {
  try {
    const { data } = await api.get('/auth/profile');
    return data;
  } catch (error) {
    if (error instanceof Error) {
      throw error;
    }
    throw new Error('获取用户信息失败，请重试');
  }
}

export async function refreshToken(): Promise<AuthResponse> {
  try {
    const response = await api.post('/api/auth/refresh');
    return response.data;
  } catch (error) {
    throw error;
  }
}

export async function logout(): Promise<void> {
  try {
    await api.post('/api/auth/logout');
  } catch (error) {
    console.error('Logout failed:', error);
    throw error;
  }
}
