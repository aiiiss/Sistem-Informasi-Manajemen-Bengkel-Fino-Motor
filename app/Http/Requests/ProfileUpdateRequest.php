<?php

namespace App\Http\Requests;

use App\Models\User;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class ProfileUpdateRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
            // Validasi nama depan dan belakang sesuai kolom database
            'first_name' => ['required', 'string', 'max:45'], 
            'last_name' => ['nullable', 'string', 'max:45'],
            
            'email' => [
                'required', 
                'string', 
                'lowercase', 
                'email', 
                'max:100', // Sesuai panjang kolom di database
                // PERBAIKAN: Abaikan pengecekan unik untuk ID user yang sedang login
                // Format: Rule::unique('nama_tabel', 'nama_kolom')->ignore(id_user)
                Rule::unique('users', 'email')->ignore($this->user()->id),
            ],
        ];
    }
}