import type { AuthRepository } from "../domain/repositories";
import { authApi } from "./authApiDataSource";
import { tokenStorage } from "../../../core/storage/tokenStorage";
import { LoginInput, RegisterInput } from "../domain/entities";

export const authRepositoryImpl: AuthRepository = {
  async login(input: LoginInput) {
    const tokens = await authApi.login(input);
    await tokenStorage.setTokens(tokens.access, tokens.refresh);
    return tokens;
  },

  async register(input: RegisterInput) {
    await authApi.register(input);
  },

  async logout() {
    await tokenStorage.clear();
  },

  async getAccessToken() {
    return tokenStorage.getAccessToken();
  },
};
