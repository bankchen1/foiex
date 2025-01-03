export interface User {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
  nickname: string;
  avatar?: string;
  is2FAEnabled: boolean;
  createdAt: number;
  updatedAt: number;
}

export interface UserAssets {
  [currency: string]: {
    available: string;
    locked: string;
    total: string;
  };
}

export interface KYCData {
  id: string;
  userId: string;
  status: 'pending' | 'approved' | 'rejected';
  type: 'basic' | 'advanced';
  documents: {
    type: string;
    url: string;
  }[];
  updatedAt: number;
}
