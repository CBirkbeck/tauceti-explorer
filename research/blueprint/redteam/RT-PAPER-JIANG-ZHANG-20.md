# RT-PAPER-JIANG-ZHANG-20

Red team of the accepted extraction PAPER-JIANG-ZHANG-20: Dihua Jiang and Lei Zhang, *Arthur parameters and cuspidal
automorphic modules of classical groups*, Annals of Mathematics 191 (2020), 739–827. Issue #4083.

Red team: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write or review:
- the extraction (`cc-d67081`, PR #1931);
- its review (`cc-39fac3`, PR #2447).

Disclosures. Five findings cite deliverables of this session as precedents or existing records: /7
(RT-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/1, #5433, for one of its three parts), /10 and /20
(FIX-RT-PAPER-GAN-ICHINO-18, #5231), /24 (RT-PAPER-YU-23, #5375) and /35 (RT-PAPER-CAI-FRIEDBERG-KAPLAN-24, #5358). They
carry coordinator notes; no finding rests on my verdicts.

**Result: 60 findings, 7 high, 30 medium and 23 low.**

## Method

**The source.** The published version (<https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p02-s.pdf>),
free on the Annals site, was re-downloaded on 2026-10-01; its SHA-256 (`c016d972…b15f`) equals the review's record. It
has 89 pages, with printed page = PDF page + 738. arXiv 1508.03205v4, which the extraction first read, was used for
comparison.

**The passes.** Six parallel passes were run by this session.
- Five read every page: §§1–3, §4, §5, §§6–7, and Appendices A–B with the references.
- One checked the seven routes, the briefs, the nine planned statuses and duplication against the atlas stages and stage
  edges, other accepted extractions and packets, earlier red teams, `make_queue.py` and the pinned libraries (Mathlib
  082e2d3, Tau Ceti f790474).

**Merging.** Findings reported by two or more passes were merged, among them the route-3 cycle, the unitary-group period
conventions (four findings) and the L-functions of ρ = ∧², Sym², Asai (three).

**What I re-verified myself.** Every high finding, at its evidence: p. 753 on simple parameters; the stage edges of
`data/atlas.json` (AS.2 lies upstream of ML.4 and ET.6); the route 1 and 2 briefs; the conjugations of Theorem 5.3 on
the rendered p. 786 against Theorem 6.6 and the proofs of Theorems 6.10 and 7.1; item thm-5-7 against E26; and
Conjecture 6.8's standing hypothesis on pp. 803–804.

The full list of what was checked is in the result's `checked` field.

## The high findings

### /1 — error

**Where.** research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /8 (arthur-parameters)

**Claim.** The item's characterisation 'Equivalently, each (τ_i, b_i) lies in Ψ̃_2(G*_{n_i}, ξ_i) with a_i b_i = 𝔫_i^∨
and has the parity that ξ forces' is false for even special orthogonal G*_n in two ways. (a) It omits the discriminant
condition: for G*_n = SO(V*) with dim V* = 2n, ψ ∈ Ψ̃_2(G*_n) also needs ∏_i ω_{τ_i}^{b_i} = η_{V*}, the quadratic
character of disc(V*), so the clause puts one parameter into Ψ̃_2 of every quasi-split SO_{2n}. (b) A summand with N_i =
a_i b_i odd (orthogonal type) is allowed for SO_{2n}, but no orthogonal or unitary group has 𝔫_i^∨ = N_i odd (𝔫^∨ is
even for every orthogonal group, and Arthur's simple endoscopic group for odd N_i is Sp_{N_i−1}), so the clause excludes
every parameter with an odd-dimensional summand. The defining sentence of the item (ψ attached to the datum (G*_n, s,
ξ)) is right; the 'equivalently' clause is the extraction's own strengthening of a loose remark on p. 753.

**Evidence.** p. 753: 'Note that each simple parameter ψ_i = (τ_i, b_i) belongs to Ψ̃_2(G*_{n_i}, ξ_i) with n_i =
[𝔫_i/2] and N_i = 𝔫_i^∨' (same in arXiv v4 p. 16); p. 750: '𝔫^∨ to be 𝔫 if G_n is a unitary group or an even special
orthogonal group, and to be 𝔫 − 1 if G_n is an odd special orthogonal group'. Counterexamples over Q: (b) split SO_4, φ
= (1, 1) ⊞ (Sym²τ_0, 1) with τ_0 a non-CM cuspidal representation of PGL_2(A) (the parameter τ_0 ⊗ τ_0 = Sym²τ_0 ⊕ 1);
it lies in Φ̃_2(SO_4) (both summands orthogonal, distinct, central characters trivial) but N_1 = 1, N_2 = 3 are not of
the form 𝔫^∨. (a) φ = (τ_1, 1) ⊞ (τ_2, 1) with τ_i orthogonal-type (dihedral) cuspidal representations of GL_2 attached
to different quadratic fields K_1 ≠ K_2, so ω_{τ_i} = η_{K_i}; each (τ_i, 1) ∈ Ψ̃_2(SO_2^{K_i}) with N_i = 2 = 𝔫_i^∨ and
the parity is right, so the clause accepts φ for split SO_4, but η_{K_1}η_{K_2} ≠ 1 makes φ a parameter only of the
non-split quasi-split SO_4 whose discriminant character is η_{K_1}η_{K_2}.

**Fix.** Replace the 'Equivalently ...' sentence by: 'Equivalently (Arthur, §1.4; Mok, §2.4): for G*_n = SO_{2n+1},
every (τ_i, b_i) is of symplectic type (τ_i symplectic with b_i odd, or τ_i orthogonal with b_i even); for G*_n = SO(V*)
with dim V* = 2n, every (τ_i, b_i) is of orthogonal type (τ_i orthogonal with b_i odd, or τ_i symplectic with b_i even),
and ∏_i ω_{τ_i}^{b_i} = η_{V*}, the quadratic character attached to disc(V*) (summands with a_i b_i odd are allowed);
for unitary G*_n with κ = 1, every summand has η_{(τ_i, b_i)} = (−1)^{N−1}.' Drop 'each (τ_i, b_i) lies in
Ψ̃_2(G*_{n_i}, ξ_i) with a_i b_i = 𝔫_i^∨'. Add a sourceIssue (kind error, affects nothing) for the p. 753 sentence: for
even orthogonal G*_n a summand with N_i odd has simple endoscopic group Sp_{N_i−1}, not a G*_{n_i} with 𝔫_i^∨ = N_i.

### /2 — error

**Where.** research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /44 (thm-5-3), /43, /46, /48 (the
conjugations added by the review), /49 (thm-5-7), sourceIssues E26, route 2 brief (Theorem 5.3 sentence and the
corrections paragraph); research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json sourceIssues E26 (to be widened) or
new; items/65 (thm-7-1), items/62 (thm-6-10), items/56 (thm-6-6);
research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /32 (cor-4-4), /33 (thm-4-5), /34 (cor-4-6), /35
(thm-4-7), /38 (zeta-integral-formula); research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/6
(PAPER-JIANG-ZHANG-20/bessel-periods), statement and review note

**Claim.** For unitary groups the paper's complex conjugations are inconsistent, and the review fixed one reading
(bilinear periods, E26) without checking it against the rest of the paper. Theorem 5.3 as printed pairs pi bilinearly
with the descent: <phi_pi, conj F(E)> = integral of phi_pi times F(E) ((4.9) fixes <a,b> = integral of a times conj b).
But the paper also asserts F^{O_kappa0}(E_{tau x sigma}) is isomorphic to pi (Conjecture 6.7, Section 7.2, Theorem 7.1).
If F(E) is isomorphic to pi then that bilinear pairing vanishes for every vector whenever pi is not isomorphic to conj
pi (= pi dual), which happens for unitary groups whenever tau is not self-dual. So for unitary groups the printed
Theorem 5.3 and Theorem 7.1/Conjecture 6.7 cannot both hold, whatever the base-change normalization. Concrete instance,
U(1) x U(0) (n = 1, l* = 0, kappa* = 0, H_{a+m} = U(1,1), F = restriction to the stabilizer U(1) of w*): take pi = chi
with chi^2 != 1 and tau = mu, mu(t) = chi(t/tbar) (standard base change). The residue E_tau is chi'(det) with
chi'(t/tbar) = mu(t), so chi' = chi and F(E_tau) = pi (Conjecture 6.7 holds). Then the printed left side is the integral
of chi^2 over [U(1)], which is 0, while the right side is phi_pi(1), which is non-zero, so the printed Theorem 5.3
fails. The unbarred (Hermitian) statement <chi, chi> != 0 holds. With the opposite base-change normalization the printed
5.3 holds but F(E_tau) = chi^{-1} is not pi, so Theorem 7.1 fails instead. Hence E26 depends on the normalization. In
the standard one, Theorem 5.3 must be Hermitian, and L(s, tau x sigma) in (5.2) is L(s, tau x phi_sigma^vee) (finding
3). Theorem 5.7 then follows as printed for its unbarred hypothesis, and that is GGP for the bilinear pair (pi, conj
sigma). E26's replacement by L(s, tau x sigma^vee) would then be the wrong central value. Also: For unitary groups,
Theorem 5.3 as printed (bilinear pairing of pi with F(E_{tau x sigma'})) and Theorem 6.6 (every summand of F(E_{tau x
sigma'}) has parameter phi_tau) cannot both hold, and the proofs of Theorems 7.1 and 6.10 each use a different one of
the two conventions. A summand pi_i of the L^2-subspace F(E) makes the sesquilinear <phi_{pi_i}, F(E)> non-zero; the
bilinear <phi_{pi_i}, conj F(E)> = integral of phi_{pi_i} F(E) is non-zero iff the complex conjugate of pi_i, i.e.
pi_i^vee, occurs in F(E). By Lemma 6.5 the Satake parameters of pi_i^vee are those of tau^vee = tau^c, so Theorem 5.3
(<=) for pi with parameter phi_tau together with Theorem 6.6 forces tau = tau^vee, false in general for unitary groups
(e.g. BC of a U(1)-character eta is z -> eta(z/zbar), not self-dual unless eta^2 = 1). The proof of Theorem 7.1 applies
Theorem 5.3 to the summands pi_i using the bilinear pairing; the proof of Theorem 6.10 calls the sesquilinear <phi_pi,
F(E(., s))> 'the global zeta integral', whereas (4.9) defines it with the bar. E26 records the conjugation problem only
for Theorem 5.7. Orthogonal groups are unaffected (pi^vee is pi or its O~-conjugate, and F(E) is O~-stable by
Proposition 6.4). Also: In Section 4 'the Bessel period for (π, σ′)' (and for (σ, π)) is the bilinear pairing defined on
p. 776 (and the bilinear inner integral of (4.44)-(4.45)), but these items do not say so, while the extraction's
bessel-periods item fixes 'the Bessel period for (π, σ)' to mean the sesquilinear ⟨F(φ_π), φ_σ⟩ = ∫ F(φ_π) φ̄_σ, i.e.
the bilinear period of (π, σ^∨). Read with that convention the items are false for unitary groups (where σ′ = σ):
Corollary 4.4 would say that vanishing of the (π, σ^∨)-period forces Z ≡ 0, whereas by Proposition 4.3 Z is controlled
by the (π, σ)-period; non-vanishing of the two is governed by different central values (the review's own E26 example:
L(½, χμ) against L(½, χμ⁻¹)). Also: The item says the Bessel period 'in Conjecture 2.3, (5.6) and Theorems 5.3, 5.7 and
6.10 is the sesquilinear <F(phi_pi), phi_sigma>_H' and that '(5.6) nevertheless writes it P(phi_pi, phi_sigma)'. On the
page images, (5.6) and Theorem 5.3 print <F(phi_pi), conj(phi_sigma)>, the bilinear period, consistent with (4.7); the
item thm-5-3 (items/44) says so correctly, so the two items contradict each other. The correct split, needed to read
thm-6-10 and thm-7-1: sesquilinear (no bar): Conjecture 2.3 (p. 757), Theorem 5.7 (p. 791), Theorem 6.10 (p. 805),
Corollary 6.11 (p. 807); bilinear (bar): (5.6) (p. 785), Theorem 5.3 (p. 786), Section 6.2 (p. 801), proof of Theorem
7.1 (pp. 807-808). In particular the sigma of Theorem 7.1 (bar) is the complex conjugate of the sigma that Conjecture
2.3 (no bar) supplies.

**Evidence.** p. 766, (4.9): 'Z(s, ...) := P(E, phi_pi) = integral F(E)(g) phi_pi(g) dg = <phi_pi, conj F(E)>'. p. 785,
(5.6): 'P(phi_pi, phi_sigma) = <F(phi_pi), conj phi_sigma>' (the bar is also in v4, p. 50). p. 786, Theorem 5.3:
'<phi_pi, conj F^{psi_O_kappa*}(E_{tau x sigma'})>_{G_n} ... non-zero ... if and only if ... <F^{psi_O_l*}(phi_pi), conj
phi_sigma>_{H_m}' (bars seen on the page image). p. 808, proof of Theorem 7.1: 'F(E_{tau x sigma'}) = pi_1 + pi_2 + ...
We apply Theorem 5.3 to pi_i for all i. The non-vanishing of the Bessel period <phi_{pi_i}, conj F(E_{tau x
sigma'})>_{G_n} implies ...': for pi_i inside F(E) this non-vanishing holds for the Hermitian pairing, not the bilinear
one. p. 809: 'D(tau; empty) = F(E_tau) is a non-zero cuspidal automorphic representation'. p. 791: Theorem 5.7's
hypothesis '<F(phi_pi), phi_sigma>_{H_m}' has no bar, and the proof passes to 'F(E_{tau x sigma-bar'}) is non-zero'.
U(1) computation: chi'(det) lies in Ind(mu|.|^{-1/2}) on the Levi t -> diag(t, tbar^{-1}) (the paper's diag(g, h, g*),
(A.6)), where det = t/tbar; det restricted to the stabilizer of an anisotropic vector is z. The unfolded zeta integral,
integral over U(1)(A) of chi(g) phi_s(eta g), is 1 at inert unramified places and L(s+1/2, chi^2)L(s+1/2,
chi^{-2})/zeta(2s+1) at split ones, so it represents L(s+1/2, mu^2)/L(2s+1, mu, As+), which has no pole at s = 1/2 when
mu^2 != 1. Also: p. 766, (4.9): 'Z(s, phi_pi, phi_{tau x sigma}, psi_{l,w0}) := P^{psi_{l,w0}}(E(phi_{tau x sigma}, s),
phi_pi) ... = <phi_pi, conj(F^{psi_{l,w0}}(E(phi_{tau x sigma}, s)))>' with (4.8) <phi_1, phi_2> = integral of phi_1
times conj(phi_2). p. 786, Theorem 5.3: 'the Bessel period <phi_pi, conj(F^{psi_{O_kappa*}}(E_{tau x sigma'}))>_{G_n}
... is non-zero ... if and only if the Bessel period <F^{psi_{O_l*}}(phi_pi), conj(phi_sigma)>_{H_m} ... is non-zero'
(bars on the page image). p. 800, Theorem 6.6(2): 'all pi_i ... have a generic global Arthur parameter belonging to the
O~(G)-orbit of phi_tau'; p. 796: 'for all the other cases ... O~ is trivial'. p. 806 (proof of Theorem 6.10): 'the
Bessel period <phi_pi, F(E_{tau x sigma_0})> is non-zero. By replacing the residue ... we obtain that the global zeta
integral <phi_pi, F(E(., phi_{tau x sigma_0}, s))> is non-zero' (no bar). p. 808 (proof of Theorem 7.1): 'We apply
Theorem 5.3 to pi_i for all i. The non-vanishing of the Bessel period <phi_{pi_i}, conj(F^{psi_{O_kappa0}}(E_{tau x
sigma'}))>_{G_n} implies ...' (bar). Also: p. 776: 'Note that the pairing P^{ψ^{-1}_{β−1,y−κ}}(φ_π, φ_σ′) = ∫_{[H^η_m]}
F^{ψ^{-1}_{β−1,y−κ}}(φ_π)(x) φ_σ′(x) dx defines a Bessel period for the pair (π, σ′) ... Corollary 4.4. If the Bessel
period for (π, σ′) is zero, then the global zeta integral Z(s, φ_{τ⊗σ}, φ_π, ψ_{ℓ,w0}) is zero for all choices of data.'
p. 779: 'the inner integration in the variable h in (4.44) gives a Bessel period for the pair (σ, π)' with (4.45)
∫_{[G^{w0}_{m−}]} φ_π(h) J_s(φ_s)(hn) dh (no conjugation). Against this, bessel-periods item: "'the Bessel period for
(π, σ)' in Conjecture 2.3, (5.6) and Theorems 5.3, 5.7 and 6.10 is the sesquilinear ⟨F^{ψ_{O_ℓ}}(φ_π), φ_σ⟩_H"; p. 785
(5.6) and p. 791 ('Because σ̄ is isomorphic to the contragredient σ∨ of σ ...'). Also: p. 785: '(5.6)
P^{psi_{O_l*}}(phi_pi, phi_sigma) = <F^{psi_{O_l*}}(phi_pi), conj(phi_sigma)>_{H} != 0'. p. 786 (Theorem 5.3):
'<F^{psi_{O_l*}}(phi_pi), conj(phi_sigma)>_{H_m}'. p. 757 (Conjecture 2.3): 'the L^2-inner product
<F^{psi_{O_l0}}(phi_pi), phi_sigma>' (no bar). p. 807 (proof of Theorem 7.1): '<F^{psi_{O_l0}}(phi_pi),
conj(phi_sigma)>_{H_m} is non-zero'.

**Fix.** Add a sourceIssue (kind error, affects 'a stated result': Theorems 5.3, 5.7 and 7.1 for unitary groups, known:
new): the conjugations in (5.6), Theorem 5.3, (5.14), Proposition 5.6, Section 5.5 and the proof of Theorem 7.1 are
inconsistent for unitary groups (U(1) x U(0) example above). Fix one normalization explicitly and make items 13, 36, 43,
44, 46, 48, 49 and the route-2 brief agree with it. Recommended, since it is consistent with Conjecture 6.7, Section 7
and Mok's standard base change: state item 44 for unitary groups as '<phi_pi, F^{psi_O_kappa*}(E_{tau x sigma'})>_{G_n}
!= 0 for some data iff <F^{psi_O_l*}(phi_pi), phi_sigma>_{H_m} != 0 for some data' (Hermitian pairings). For orthogonal
groups, where conj sigma is isomorphic to sigma, this is equivalent to print. Change the period definitions in items 43,
46 and 48 to match. Re-examine E26 in this normalization: with L(s, tau x sigma) the L-function of (5.2), Theorem 5.7
holds as printed, so E26 should be withdrawn or restated as the misprint 'conj sigma'' in Section 5.5. If the barred
statements are kept instead, record that the normalization making them true gives F(E_{tau x sigma}) isomorphic to conj
pi, and restate Conjecture 6.7, Theorem 7.1 and Corollaries 7.2 and 7.4 with conj pi for unitary groups. Also: Widen E26
(or add a sourceIssue, kind gap, affects stated results) to: 'For unitary groups the complex conjugations in (4.9),
Theorem 5.3, the proofs of Theorems 6.10 and 7.1, and Theorems 5.7, 6.10 are inconsistent: with (4.9) bilinear, Theorem
5.3 for pi of parameter phi_tau makes pi^vee (parameter phi_{tau^vee}) a summand of F(E_{tau x sigma'}), contradicting
Theorem 6.6 unless tau = tau^vee. A consistent reading takes the sesquilinear pairing <phi_pi, F(E)> on the residue side
of Theorem 5.3 (i.e. pi a summand of F(E)); then Theorem 7.1 goes through as written, Theorem 5.7 gives L(1/2, tau x
sigma^vee) (E26), and Theorem 6.10 yields the bilinear period <F(phi_pi), conj(phi_sigma)> != 0 with sigma =
sigma_0^{w_q^l} in Pi~_{phi'}, not the printed <F(phi_pi), phi_sigma>. Which local identification (Lemma 6.5 at split
places, Theorem 4.8) is correct must be checked; orthogonal groups are unaffected.' Add to the notes of items/62 and
items/65: 'For unitary groups the conjugation conventions of the proof are inconsistent (see issue); the statement is
established for orthogonal groups.' Also: In cor-4-4, thm-4-5 and zeta-integral-formula write the hypothesis as 'the
bilinear Bessel period P^{ψ^{-1}_{β−1,y_{−κ}}}(φ_π, φ_{σ′}) = ∫_{[H^η_m]} F^{ψ^{-1}_{β−1,y_{−κ}}}(φ_π)(x) φ_{σ′}(x) dx
(p. 776) vanishes identically / is non-zero for some φ_π ∈ π, φ_{σ′} ∈ σ′ (in the sesquilinear convention of the
bessel-periods item: the period of (π, σ′^∨))'; in cor-4-6 and thm-4-7 likewise name the bilinear inner integral of
(4.44)–(4.45) on [G^{w_0}_{m⁻}]. Add one sentence to bessel-periods saying that Section 4 (Proposition 4.3 to (4.49))
uses the bilinear (4.7)-type pairing. Also: In items/6 replace the list by: 'Conjecture 2.3, Theorem 5.7, Theorem 6.10
and Corollary 6.11 use the sesquilinear <F(phi_pi), phi_sigma>_H = P(phi_pi, conj(phi_sigma)); (5.6), Theorem 5.3,
Section 6.2 and the proof of Theorem 7.1 use <F(phi_pi), conj(phi_sigma)>_H = P(phi_pi, phi_sigma), the bilinear period
of (4.7).' Delete '(5.6) nevertheless writes it P^{psi_{O_l*}}(phi_pi, phi_sigma)'.

### /3 — error

**Where.** research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /49 (thm-5-7) statement; route 2 brief,
'Theorem 5.7: ... then L(s, pi x sigma) is holomorphic and non-zero at 1/2';
research/blueprint/papers/PAPER-JIANG-ZHANG-20.md, Section 'The global Gan-Gross-Prasad conjecture'

**Claim.** The extraction accepted sourceIssue E26: the conclusion L(s, tau x sigma) of Theorem 5.7 is unjustified for
unitary groups, and the argument gives L(s, tau x sigma^vee). Yet item 49 still states 'Then L(s, pi x sigma) = L(s, tau
x sigma) is holomorphic and non-zero at s = 1/2', and its note does not mention E26. The brief's body states the same,
and only its trailing corrections paragraph contradicts it. The report says 'A non-zero Bessel period forces L(1/2, pi x
sigma) != 0, for all these groups'. PROTOCOL section 18 requires items to use the corrected statements. As written, the
item asserts for unitary groups a statement that the extraction's own accepted sourceIssue says the paper does not
prove. Finding 1 argues that E26 itself needs re-examination. Whichever way that goes, the item, the brief, the report
and E26 must agree, and they must state the L-function convention.

**Evidence.** Item /49 statement (quoted above). E26 correction: 'State the conclusion as L(s, tau x sigma^vee)
holomorphic and non-zero at s = 1/2 ...'. Its review verdict is 'confirmed'. p. 791, the paragraph before Theorem 5.7:
'it follows that L(s, tau x sigma^vee) is holomorphic and non-zero at s = 1/2, and so is L(s, tau x sigma)'.

**Fix.** After finding 1 is resolved, give item 49, the brief's Theorem 5.7 sentence and the report's summary one
conclusion with the convention spelled out. If E26 is kept, replace the item's last sentence with: 'Then L(s, tau x
sigma^vee) is holomorphic and non-zero at s = 1/2, with L(s, tau x X) the Rankin-Selberg L-function of tau and the
parameter of X; for orthogonal groups this is L(s, tau x sigma) = L(s, pi x sigma) (E26).' If finding 1's normalization
is adopted, keep the printed conclusion and add 'L(s, tau x sigma) is the L-function of the constant term (5.2), i.e.
L(s, tau x phi_sigma^vee) for unitary groups', and withdraw E26. In both cases add 'see E26' to the item note and delete
the stale body sentence in the brief.

### /4 — error

**Where.** research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/60 (PAPER-JIANG-ZHANG-20/conj-6-8); also
items/61 (prop-6-9), items/59 (partitions-p-phi)

**Claim.** The item states Conjecture 6.8 with no hypotheses ('for the pair of generic parameters (phi, phi') there is
sigma in Pi~_{phi'}[H*_m] ... such that p^1_{phi,phi'} in p(E_{tau x sigma})'). The paper states it 'With notation and
assumptions as above', i.e. under the standing assumptions of Section 6.3: tau as in (4.1), a = n_frak^vee = N, phi =
phi_tau in Phi~_2(G*_n), phi' generic for H*_m with (G*_n, H*_m) a relevant pair (n_frak - m_frak odd), and L(1/2, phi x
phi') != 0. Without the L-value hypothesis the item is false: if L(1/2, phi x phi') = 0 then, by Proposition 5.2, E(.,
phi_{tau x sigma}, s) has a pole of order < r at s = 1/2 for every sigma in the packet (L(s, tau x sigma) = L(s, phi x
phi')), so the r-th iterated residue E_{tau x sigma} is 0 and p(E_{tau x sigma}) is empty. Combined with items/61
(Proposition 6.9, m = 1, H_{2n+1} = SO_{2n+2,2n}), the extraction then asserts a false statement in a case it calls
proved.

**Evidence.** p. 803: 'Let phi' be a generic global Arthur parameter of H*_m. Assume that L(1/2, phi x phi') != 0.' p.
804: 'Take a member sigma in Pi~_{phi'}[H*_m] ... By Proposition 5.2, the residual representation E_{tau x sigma} of
H_{a+m}(A) is non-zero.' and 'Conjecture 6.8. With notation and assumptions as above, for the given pair of parameters
(phi, phi'), there exists a sigma ...'. p. 784, Proposition 5.2: 'E(., phi_{tau x sigma}, s) has a pole at s = 1/2 of
order r if and only if L(s, tau_i, rho) has a pole at s = 1 ... and L(s, tau x sigma) is non-zero at s = 1/2.'
Counterexample: F = Q, G*_n = split SO_3 (a = 2), H*_1 = SO_2 anisotropic for an imaginary quadratic K, phi' = Ind_K^Q 1
= 1 + eta_K (sigma = trivial character, the only member), tau the cuspidal representation of GL_2(A) of the elliptic
curve 37a (trivial central character, root number -1, L(1/2, tau) = 0). Then L(1/2, phi x phi') = L(1/2, tau) L(1/2, tau
x eta_K) = 0, E_{tau x 1} = 0 on H_2 = SO_{4,2}, and p^1 = [3 1^3] is not in p(E_{tau x 1}) = empty set, although this
is exactly the case m = 1, H_{2n+1} = SO_{2n+2,2n} (n = 1) of Proposition 6.9.

**Fix.** Replace the statement of items/60 by: 'Conjecture: let tau = tau_1 [+] ... [+] tau_r be as in (4.1), a =
n_frak^vee = N, phi = phi_tau in Phi~_2(G*_n), and let phi' be a generic global Arthur parameter of H*_m, where (G*_n,
H*_m) is a relevant pair (n_frak - m_frak odd), with L(1/2, phi x phi') != 0. Then there is sigma in Pi~_{phi'}[H*_m],
with a cuspidal realization C_sigma on a pure inner form H_m(A), such that p^1_{phi,phi'} lies in p(E_{tau x sigma}),
where E_{tau x sigma} on H_{a+m}(A) is defined through C_sigma (it is non-zero by Proposition 5.2).' Add the same
standing hypotheses to the first sentence of items/59 and to items/61 ('Conjecture 6.8 (under L(1/2, phi x phi') != 0)
holds when ...').

### /5 — error

**Where.** research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json route 3 (AutomorphicSpectralTheory:AS.2), items
thm-5-1, rev-normalized-intertwining-operators-for-generic, normalized-intertwining; route 2 brief ('AS.1–AS.4 for
Eisenstein series, intertwining operators with Shahidi's normalization and Theorem 5.1');
research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json route 3 (source, AutomorphicSpectralTheory:AS.2) with items
/40 normalized-intertwining, /41 thm-5-1, /84 rev-normalized-intertwining-operators-for-generic; brief of route 2
(imports sentence)

**Claim.** Route 3 asks AS.2 to plan Theorem 5.1 = Theorem B.2, but that theorem is stated for σ in the generic local
L-packets Π̃_{φ⁺}(H_m) of pure inner forms and is proved from Proposition B.1 (routed to ML.4 by route 4), from the
existence of a generic member of the packet (Arthur, Mok: ML.4), and from Tadić's and Vogan's generic unitary duals
(routed to ET.6 and AF.1). The normalizing factors (5.4) themselves are defined through the generic global Arthur
parameter of σ. In the atlas AS.2 is an ancestor of both ML.4 and ET.6, so AS.2 cannot plan these items without a stage
cycle AS.2 → AS.3 → AS.6 → ML.4 → AS.2 (and AS.2 → AS.3 → AS.6 → ET.4 → ET.6 → AS.2). The same items also use the
TAD-specific setup (P_â ⊂ H_{a+m}, ω_0), which makes AS and the new TAD roadmap import each other. Also: Route 3 puts
into AS.2 three items whose statements and proofs need layers that themselves depend on AS.2, so the route creates a
dependency cycle. The normalization (5.3)-(5.4) uses local L-factors defined through the localizations of Arthur's
generic global parameters, and Theorem 5.1 = B.2 is stated for σ in Arthur-Mok-KMSW local packets. Its proof uses
Proposition B.1 (/74, routed to ML.4) and Tadić's unitary dual (/75, routed to ET.6). /84 is stated for the generic
member of such a packet. But ML.4 requires AS.6 -> AS.3 -> AS.2, and ET.6 requires ET.4 -> AS.6 -> AS.3 -> AS.2. So AS.2
cannot import what these items need.

**Evidence.** p. 783: 'Since the cuspidal automorphic representation σ is assumed to have a generic global Arthur
parameter, we define, following [3], the local L-factors at ν ∈ S in terms of τ and the generic global Arthur parameter
of σ. Then we take the Shahidi normalization …'. p. 818 (proof of Theorem B.2): 'the local L-packet Π̃_{φ⁺}(H_m) has a
generic member σ° ([3] and [70]) when H_m = H*_m is quasisplit'; 'by Proposition B.1, the standard modules as displayed
in (B.2) are irreducible. This is the key point'; 'According to the structure of the generic unitary dual of the general
linear groups, given by Vogan in [79] for the archimedean case and by Tadić in [78] for the non-archimedean case'.
data/atlas.json: ModularityAndLanglandsExtensions:ML.4 requires [AutomorphicSpectralTheory:AS.6, ML.0]; AS.6 requires
[AS.3, AS.4]; AS.3 requires [AS.2]; ET.6 requires ET.4, and ET.4 requires [AS.6, ET.3]. Route 3's reason cites only
'Mœglin–Waldspurger, Kim and Waldspurger' as inputs. Also: p. 783: 'we define, following [3], the local L-factors at ν ∈
S in terms of τ and the generic global Arthur parameter of σ. Then we take the Shahidi normalization by defining ...
(5.3)'. p. 818, Theorem B.2: 'Let φ+ be a local ν-component of an Hm-relevant, generic global Arthur parameter of H*m
... σ is an irreducible representation in the generic local L-packet Π̃φ+(Hm)'; proof: 'by Proposition B.1, the standard
modules as displayed in (B.2) are irreducible'; pp. 818-819: 'given by Vogan in [79] ... and by Tadić in [78]'.
data/atlas.json: ModularityAndLanglandsExtensions:ML.4 requires [AutomorphicSpectralTheory:AS.6, ML.0]; AS.6 requires
[AS.3, AS.4]; AS.3 requires [AS.2]; EndoscopicTransferAndUnitaryTraceComparison:ET.4 requires [AS.6, ET.3]; ET.6
requires ET.4. Item /11 generic-local-parameters is planned in ML.4.

**Fix.** Move thm-5-1, rev-normalized-intertwining-operators-for-generic and normalized-intertwining from route 3 to
route 2 (TwistedAutomorphicDescents), which is downstream of ML.4, ET.6 and AS.2. Alternatively keep
normalized-intertwining at AS.2 only if it is restated with β_ν an arbitrary given meromorphic normalizing function (no
Arthur parameters). Route 3 keeps rev-normalized-gl-gl-intertwining-operators ([MW89], factors from AL.3, which is not
downstream of AS.2) and rev-standard-intertwining-operators-for-tempered ([Wal03, IV.2.1], [BW00]). Replace route 3's
reason by: 'AS.2 constructs standard intertwining operators and normalized intertwiners once the normalizing factors are
supplied. The rank-one inputs used in Appendix B, the Mœglin–Waldspurger normalization for GL × GL and the holomorphy of
standard operators for tempered data, are general local results of that kind.' In the route 2 brief, layer (3), add
'Shahidi's normalization (5.3)–(5.4) and Theorem 5.1 = Theorem B.2 with its proof in Appendix B', and replace the import
clause by 'Automorphic spectral theory and trace distributions (AutomorphicSpectralTheory) AS.1–AS.4 for Eisenstein
series, standard intertwining operators, meromorphic continuation and the residual spectrum, with the rank-one inputs
routed to AS.2'. Also: Move /40, /41 and /84 from route 3 to route 2 (TwistedAutomorphicDescents), which already imports
AS.1-AS.4, ML.4, ML.5, ET.6 and AF.1. Keep in route 3 only /81 and /82, the GL × GL and tempered standard-operator
inputs, which involve no Arthur packets. Reword route 3's reason to say that AS.2 supplies the standard operators, their
rank-one factorization (cocycle relation) and these two holomorphy inputs. In route 2's brief, replace 'AS.1–AS.4 for
Eisenstein series, intertwining operators with Shahidi's normalization and Theorem 5.1' with 'AS.1–AS.4 for Eisenstein
series, standard intertwining operators, their rank-one factorization and the GL × GL and tempered holomorphy inputs;
Shahidi's normalization (5.3)–(5.4) through Arthur parameters and Theorem 5.1 = Theorem B.2 are proved in this roadmap
from ML.4 (generic local packets, Proposition B.1), ET.6/AF.1 (generic unitary duals) and the local factors'. Update the
notes of /41 and /84 and the review's route-3 verdict.

### /6 — duplicate

**Where.** route 1 brief and items local-bessel-functionals, bessel-periods
(GanGrossPrasadConjecturesForClassicalGroups) versus route 2 brief layer (1) and items fourier-coefficients,
bessel-modules, explicit-bessel-data, lemma-2-4, global-zeta-integral (TwistedAutomorphicDescents)

**Claim.** The Bessel data and the Bessel–Fourier coefficient are planned by both new roadmaps, and the GGP items are
defined through constructions that only the TAD route owns. local-bessel-functionals defines R_{O_ℓ} = H_m ⋉ V_{p_ℓ} and
ψ_{O_ℓ} through the unipotent subgroup and character attached to an F-rational nilpotent orbit of p_ℓ
(fourier-coefficients, explicit-bessel-data, TAD). bessel-periods integrates the Bessel–Fourier coefficient
F^{ψ_{ℓ,w_0}} of (4.4)–(4.5), whose N_ℓ and w_0 = y_κ are defined in explicit-bessel-data, lemma-2-4 and
global-zeta-integral (TAD). The GGP brief lists the 'local Bessel data R_{O_ℓ} = H_m ⋉ V_{p_ℓ}, ψ_{O_ℓ} for p_ℓ' and
'global Bessel periods ∫ F^{ψ_{ℓ,w_0}}(φ_1) φ_2' as its own targets, while the TAD brief plans 'Bessel coefficients and
modules' and 'explicit Bessel data' in its layer (1) and imports Bessel models and periods from GGP. The GGP brief does
not import TAD (and must not, since TAD imports GGP), so its design job must either import TAD, closing a cycle between
the two new roadmaps, or plan the same objects a second time.

**Evidence.** Route 1 brief: 'local Bessel data R_{O_ℓ} = H_m ⋉ V_{p_ℓ}, ψ_{O_ℓ} for p_ℓ = [(2ℓ+1)1^{𝔫−2ℓ−1}] … global
Bessel periods ∫ F^{ψ_{ℓ,w_0}}(φ_1) φ_2'; imports ML.4, SR.2–SR.3, AF.1–AF.3, AL.3–AL.4 only. Route 2 brief: '(1) The
groups and their Fourier coefficients: … Fourier coefficients attached to partitions and nilpotent orbits, Fourier
modules and p^m(π), Bessel coefficients and modules, … explicit Bessel data with Lemma 2.4'; 'Imports … The
Gan–Gross–Prasad conjectures for classical groups … for relevant pairs, Vogan packets, Bessel models … and Bessel
periods'. Item local-bessel-functionals: 'p_ℓ = [(2ℓ+1)1^{𝔫−2ℓ−1}], V_{p_ℓ} the associated unipotent subgroup and
ψ_{O_ℓ} the generic character of an F-rational orbit O_ℓ'. Paper p. 765: '(4.4) F^{ψ_{ℓ,w_0}}(E(·, φ, s))(h) :=
∫_{N_ℓ(F)\N_ℓ(A)} …, where the unipotent subgroup N_ℓ of H_{a+m} determined by the partition p_ℓ is similar to the
unipotent subgroup V_ℓ of G_n considered in Section 2.3'; '(4.5) w_0 = y_κ'.

**Fix.** Give the Bessel data one owner, the GGP roadmap, in the form of [GGP12, §12] that needs no nilpotent orbits:
for (W ⊂ V) with W^⊥ = X ⊕ X^∨ ⊕ E·e split of dimension 2ℓ + 1, the parabolic stabilising a full isotropic flag of X,
its unipotent radical N_ℓ, the generic character ψ_ℓ built from the flag and e, R_ℓ = H ⋉ N_ℓ, and the global Bessel
coefficient ∫_{[N_ℓ]} φ(nh)ψ_ℓ^{-1}(n) dn with the Bessel period. Rewrite local-bessel-functionals and bessel-periods in
that form. In the route 2 brief, replace 'Bessel coefficients and modules' in layer (1) by 'Bessel modules (built on the
Bessel coefficients imported from the GGP roadmap), and the identification of the GGP Bessel data with the Fourier data
(V_{p_ℓ}, ψ_{O_ℓ}) of the partition p_ℓ (explicit Bessel data, Lemma 2.4, Propositions 2.5–2.6)'. In the route 1 brief
add: 'Bessel data and Bessel coefficients are defined here as in [GGP12, §12]; the twisted-descent roadmap identifies
them with Fourier coefficients attached to nilpotent orbits and does not redefine them.'

### /7 — other

**Where.** route 1 brief ('records which cases each consumer proves: the proposed roadmap TwistedAutomorphicDescents …
proves one direction in general and the other under its Conjecture 6.8, and later papers in the queue … prove further
cases'); the GGP design job assembled by make_queue from the accepted routes JIANG-ZHANG-20 r1,
BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 r3, BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 r4, LIU-ETAL-22 r17, NELSON-VENKATESH-21 r2

**Claim.** The GGP roadmap that this extraction proposes is placed in import cycles with its consumers. (a) JZ20's brief
tells the GGP roadmap to 'record which cases each consumer proves', citing TwistedAutomorphicDescents, which imports
GGP. BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 r4 says the opposite ('record them there as proved, and state here only the
conjectures and definitions'). (b) LIU-ETAL-22 r17 tells the GGP design to 'Import
JacquetRallisRelativeTraceComparison', which imports GGP (BEUZARTPLESSIS-LIU-ZHANG-ETAL-21 r2,
BEUZARTPLESSIS-CHAUDOUARD-ZYDOR-22 r2). This depends on RT-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/1, which has no review
and whose fix is not applied. (c) New: NELSON-VENKATESH-21 r2 puts the averaged-period Theorem 31.11 into GGP while
routing 'the machinery behind the theorem' to QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (r1), and r1
imports 'GGP pairs, local multiplicity one, the local period … and the branching coefficient' from GGP. So GGP and that
roadmap import each other. make_queue merges all five routes into one design job, so the design inherits every cycle.
Coordinator note: part (b) rests on RT-PAPER-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/1, a finding of this session's red team
(PR #5433); parts (a) and (c) are independent of it.

**Evidence.** make_queue.py paper_designs: 'A new roadmap that several papers call for is one job too'; key ('new',
route['roadmap']). BPCZ22 r4 brief: 'The global conjecture … and the refined conjecture for tempered σ are proved in the
consumer JacquetRallisRelativeTraceComparison …; record them there as proved, and state here only the conjectures and
definitions.' LIU-ETAL-22 r17 brief: 'Import JacquetRallisRelativeTraceComparison (the Part II of
EndoscopicTransferAndUnitaryTraceComparison proposed for the global Gan–Gross–Prasad conjecture)'. BPLZZ21 r2 brief:
'Additional imports: The Gan–Gross–Prasad conjectures for classical groups (GanGrossPrasadConjecturesForClassicalGroups
…)'. NV21 r2 brief: 'and the main theorem (Theorem 31.11) … The machinery behind the theorem is routed by this
extraction to QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups; … That roadmap … imports the local period from
here.' NV21 r1 brief: '… the local period ∫_H⟨sv1, v2⟩⟨u1, su2⟩ with its convergence (18.1) and positivity, and the
branching coefficient from GanGrossPrasadConjecturesForClassicalGroups'.

**Fix.** Replace in the route 1 brief 'and records which cases each consumer proves: the proposed roadmap
TwistedAutomorphicDescents (PAPER-JIANG-ZHANG-20) proves one direction in general and the other under its Conjecture
6.8, and later papers in the queue (…) prove further cases for unitary groups' by: 'It imports none of its consumers.
Proved cases live in the consumers and are recorded there: TwistedAutomorphicDescents (Theorems 5.7 and 6.10, Corollary
6.11), the Jacquet–Rallis layers of EndoscopicTransferAndUnitaryTraceComparisonPartII (unitary cases), and
QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups (the averaged-period theorem of Nelson–Venkatesh). Where another
brief merged into this design asks for a consumer's theorem or an import from a consumer, the theorem stays with the
consumer.' Note for the maintainer: remove 'Import JacquetRallisRelativeTraceComparison' and the items cited-BPLZZ-ggp
and lemma-8-2-1 from LIU-ETAL-22 r17 (as RT-…-BEUZARTPLESSIS-LIU-ZHANG-ETAL-21/1 asks). Move Theorem 31.11 and its
family-size, conductor and subconvexity statements (NV21 items 98 and the like) from NV21 r2 to r1, leaving the
Ichino–Ikeda/N. Harris conjecture and the branching coefficient in GGP.

## All findings

| Finding | Severity | Kind | Where | Claim (abridged) |
|---|---|---|---|---|
| /1 | high | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /8 … | The item's characterisation 'Equivalently, each (τ_i, b_i) lies in Ψ̃_2(G*_{n_i}, ξ_i) with a_i b_i = 𝔫_i^∨ and has the parity that ξ forces' is false for even … |
| /2 | high | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /44 …; … | For unitary groups the paper's complex conjugations are inconsistent, and the review fixed one reading (bilinear periods, E26) without checking it against the … |
| /3 | high | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /49 …; … | The extraction accepted sourceIssue E26: the conclusion L(s, tau x sigma) of Theorem 5.7 is unjustified for unitary groups, and the argument gives L(s, tau x … |
| /4 | high | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/60 …; … | The item states Conjecture 6.8 with no hypotheses ('for the pair of generic parameters (phi, phi') there is sigma in Pi~_{phi'}[H*_m] ... such that … |
| /5 | high | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json route 3 …; … | Route 3 asks AS.2 to plan Theorem 5.1 = Theorem B.2, but that theorem is stated for σ in the generic local L-packets Π̃_{φ⁺}(H_m) of pure inner forms and is … |
| /6 | high | duplicate | route 1 brief and items local-bessel-functionals, bessel-periods … | The Bessel data and the Bessel–Fourier coefficient are planned by both new roadmaps, and the GGP items are defined through constructions that only the TAD … |
| /7 | high | other | route 1 brief ('records which cases each consumer proves: the …; … | The GGP roadmap that this extraction proposes is placed in import cycles with its consumers. (a) JZ20's brief tells the GGP roadmap to 'record which cases each … |
| /8 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /20 … | For unitary G_n, the group (2.13) {diag(I_ℓ, γ, I_ℓ) : γ J w_0 = J w_0} ≅ U(W_{𝔩⁻}) is not 'the identity component of the stabilizer of ψ_{ℓ,w_0}' in the Levi … |
| /9 | medium | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /12 …; … | Status 'planned' with planned = [ET.6] overclaims. The item states the correspondence 'over local fields of characteristic 0' and cites Langlands [55] for the … |
| /10 | medium | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /9 …; … | Both items are 'planned' in ML.4 for every pure inner form G_n. For non-quasi-split orthogonal G_n, ML.4 has no proof source. ML.4 names Arthur, Mok and KMSW, … |
| /11 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /7 …; … | The statement still pairs the paper's sesquilinear period ⟨F^{ψ_{O_ℓ}}(φ_π), φ_σ⟩ = ∫ F(φ_π) φ̄_σ with Gan–Gross–Prasad's L(1/2, φ × φ′). The review flagged … |
| /12 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /1 … | The global Vogan packet is not defined: the item only says it 'is formed from the local ones'. The paper never defines it either, yet uses it in Theorem 6.10, … |
| /13 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /11 … | The item states, for every G*_n, that the localization is φ_ν = ⊕_j (φ_j/·/^{β_j} ⊕ φ_j^∨/·/^{−β_j}) ⊕ φ_0 with a Levi GL_{n_1} × ⋯ × GL_{n_t} × G*_{n_0}. The … |
| /14 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /23 …; … | Proposition 2.6 is existential in the big group: for a given H_m there is some G_n and some orbit with H_m ≅ H^{O_ℓ}. The paper cites it three times for a … |
| /15 | medium | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /21 …; … | The note of /21 says 'For quadratic forms, Witt extension and cancellation are planned in … |
| /16 | medium | duplicate | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json route 2 …; … | Route 2 plans 'the structure of G_n = Isom(V, q)°, Fourier coefficients attached to partitions and nilpotent orbits' without importing the roadmaps that … |
| /17 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /71 … | The item still has no statement: it describes [GRS11, Thm. 7.3] as 'a criterion ... for the cuspidality' and gives neither hypotheses nor conclusion. The … |
| /18 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /38 … | The item takes sections phi_{tau⊗sigma',s} in I_s(tau, sigma'), i.e. the Eisenstein series built from tau⊗sigma' with sigma' = sigma^{w_q^l}, but assumes a … |
| /19 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /36 … | For unitary H_{a+m}, the denominator L(s + 1, τ_ν × σ_ν) of (4.47) is not the normalizing factor of the Eisenstein series when L(s, τ × σ) := L(s, φ_τ × φ_σ) … |
| /20 | medium | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /13 …; … | The item claims as planned the L-functions L(s, τ, ρ) for ρ = ∧², Sym² and Asai, with their meromorphy and ramified local factors. None of the named stages … |
| /21 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /28 …; … | The open-cell reduction (4.15)→(4.16)/(4.17) is obtained from cited results that no item records. These are [23] = GRS11, Prop. 4.4, applied to the double … |
| /22 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /13 … | Item 13 defines L(s, tau x pi) := L(s, tau x phi_pi) and L(s, tau x sigma) as Rankin-Selberg L-functions of general linear groups. For unitary groups this … |
| /23 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /41 …; … | Theorem 5.1 = B.2 claims that N(omega_0, tau x sigma, s) is holomorphic AND non-zero for Re(s) >= 1/2. For non-generic sigma the proof only shows that each … |
| /24 | medium | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /39 …; … | The item is marked planned, but its own review note says AS.1 and AS.2 plan it 'only in part'. The parts that carry the content of (5.2) are planned nowhere. … |
| /25 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /45 … | The item states (5.11), Z(s, .) = Z*_S(s, .) L(s, tau, pi, sigma; rho), and parts (1)-(2) only 'under the assumptions of Theorem 5.3'. But Z_nu (4.41) and the … |
| /26 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /83 … | Item 83 is a general local fact. Tempered L-factors L(s, phi x phi_0) and L(s, phi, rho) are holomorphic in Re s > 0 and agree with the Langlands-Shahidi … |
| /27 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json …; … | For unitary groups the proof of Lemma 6.5 (and the parallel sentence in the proof of Proposition 6.2) only treats places of F inert in E. It asserts that … |
| /28 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json …; … | Proposition 6.3 (cuspidality of the kappa_0-th Bessel module) is proved by checking the hypotheses of the tower property [GRS11, Th. 7.3], which the extraction … |
| /29 | medium | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/53 …; … | Proposition 6.3 (and hence Theorem 6.6(1)) is stated for every automorphic member Sigma of Pi~_{psi_{tau,sigma}}(H_{a+m}), but the proof treats only cuspidal … |
| /30 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json …; … | E4's amended correction says Theorem 2.1 'is thus available for the generic parameters the main theorems use; it remains unproved as stated (all psi) for … |
| /31 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/50 … | The item asserts that for any phi_tau in Phi~_2(G*_n) and any sigma in A_cusp(H_m) with generic phi_sigma in Phi~_2(H*_m), psi_{tau,sigma} is an … |
| /32 | medium | other | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/87 …; … | Two problems. (1) Scope of the citation: the item says every automorphic member of Pi~_{phi'}[H*_m] occurring in the discrete spectrum of a pure inner form H_m … |
| /33 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/70 … | The item is a description, not a statement: 'vanishing above the critical kappa and, at the critical kappa, a constituent of an explicit unramified principal … |
| /34 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /84 …; … | /84 attributes to [CKPSS04, Thm 11.1] a result for every quasi-split H*_m over every local field, with conclusion for Re(s) ≥ ½. That is not the cited theorem. … |
| /35 | medium | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json route 5 …; … | Both unitary-dual classifications are routed as 'source' into layers whose descriptions contain no unitary representation theory. ET.6 builds the local … |
| /36 | medium | other | route 7 (ModularityAndLanglandsExtensions:ML.5), item grs-descent; … | As stated, grs-descent is a theorem about the Bessel coefficient F^{O_{κ_0}}_n(E_τ) of the residual representation E_τ. That object is defined in the TAD … |
| /37 | medium | other | route 1 brief imports; … | Relevant pairs and pure inner forms need the classification of quadratic and hermitian spaces over local and global fields: pure inner forms of SO(V*) … |
| /38 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json … | A misstatement in range that no sourceIssue records: every F-quasisplit G*_n is said to have Witt index n = [𝔫/2]. This fails for quasi-split non-split even … |
| /39 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /14 … | Two slips against the page. (1) The minimal parabolic is written P_0 = (Res_{E/F}S × G_{𝔡_0}) ⋉ N_0, indexing the anisotropic-kernel group by its dimension. … |
| /40 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /69 … | 'Every generic π ∈ A_cusp(G*_n) has such a τ as its transfer ([CKPSS04] with [GRS11])' is asserted for G*_n = U_{2n+1} too. … |
| /41 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /22 …; … | Both say 'Proposition 2.5 is not cited elsewhere' ('so nothing downstream depends on it'). Section 6.2 cites it, in a remark explaining why σ and H_m are … |
| /42 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /5 … | Luo's thesis is cited as '[Luo, thesis 2020]'; the paper's reference [59] dates it 2021. |
| /43 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /11 … | 'Generic' for quasi-split classical groups is used but not defined in any item. Section 3.1 defines a generic local L-parameter through a Whittaker model of … |
| /44 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /13 …; … | The statement still says 'the Asai representation As ⊗ ξ^m'. That is the misprint the extraction itself corrects in sourceIssue E8 and in the local-l-factor … |
| /45 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json …; … | The GL-factor of G^η_{m⁻} is printed G_{E/F}(W^+_{𝔯_𝔪+a−1,β−1}), 'where W^+_{𝔯_𝔪+a−1,β−1} is defined in (4.14)'. By (4.14), W^±_{ℓ,i} = Span{e_{±(ℓ+1)}, …, … |
| /46 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /37 … | The statement 'f_{W^κ_{τ_ν}⊗σ_ν,s}, φ_{σ_ν}, φ_{π_ν} are spherical vectors normalized to take the value 1 at the identity' does not fix the normalization on … |
| /47 | low | other | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /37 …; … | The thm-4-8 note says the proof 'is deferred to Jiang–Soudry–Zhang [44]'. That is the arXiv v4 number. In the published bibliography, on which every locator … |
| /48 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /29 …; … | The whittaker-induction-map note says the step 'Uses Fourier expansion along mirabolic subgroups [JZ14, (3.38)]'. In the paper that expansion is applied to the … |
| /49 | low | library-claim | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /24 …; … | The item is 'planned' while its own review note says AS.1 and AS.2 cover it only in part. The gap is the item's generality: 'σ an automorphic representation of … |
| /50 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /44 … | The parenthesis '(Only => uses E_{tau x sigma'} != 0; the proof of <= yields it.)' is wrong. In => a non-zero period of E_{tau x sigma'} already implies E_{tau … |
| /51 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /47 …; … | The note says 'Sections supported in the open cell P_a U^-_a (A.5)'. In print the sections are (A.6); (A.5) is the U^-_{a,eta}-integral J_{s,nu}. The item's … |
| /52 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json … | The prerequisites omit the papers whose results the review added as items /81, /82 and /84 for the proof of Theorem 5.1 = B.2. These are … |
| /53 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/54 … | The item note says 'The proof uses discrete multiplicity one for odd special orthogonal H_{a+m} (item endoscopic-classification; for non-quasi-split forms this … |
| /54 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.md, section 'What the …; … | The reader report says 'Corollary 6.11. For SO_{2n+1} x SO_2 the two conditions are equivalent unconditionally.' The paper only removes Conjecture 6.8 (via … |
| /55 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items/3 …; … | Two slips. (a) The multiplicity-freeness in Theorem 6.6(2) is deduced from the local uniqueness of Bessel models, but items/3's locator, which lists the places … |
| /56 | low | missing | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json … | The parametrization of the domain (A.11) contains three misprints that E24 does not record. (i) Y' := −ω_{a−ℓ}·ι(Y)^t·(J^𝔪)^{-1} is ill-typed: ω_{a−ℓ} is … |
| /57 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json item /41 …; … | Theorem B.2 assumes τ 'self-dual'. For unitary groups (E ≠ F) the local components τ_ν of the τ in (4.1) are conjugate self-dual (τ_ν ≅ τ*_ν = ι(τ_ν)^∨), not … |
| /58 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json items /81 … | /81 has two slips. It says the GL × GL operators are 'normalized as in (5.3)–(5.4)', but (5.3)-(5.4) is the classical-group normalization with L(s, τ × σ)L(2s, … |
| /59 | low | error | research/blueprint/papers/PAPER-JIANG-ZHANG-20.result.json summary | The summary says the extraction 'routes six items as sources to AS.2, ML.4, ML.5, ET.6 and AF.1'. The source routes carry 10 items after the review (AS.2: 5, … |
| /60 | low | other | route 6 (AutomorphicFormsOnReductiveGroups:AF.1), items …; … | RT-AREA-automorphic-1/2 (confirmed) moves the smooth Fréchet globalizations, the Langlands classification and the archimedean correspondence from AF.1 to a new … |

## Notes for the fix job

- **Statements first.** Correct the high items before planning: arthur-parameters (/1), the unitary conjugation
  conventions with one consistent reading recorded as a source issue (/2), thm-5-7 against E26 (/3) and conj-6-8's
  hypothesis (/4).
- **Routes.** Move Theorem 5.1 = B.2 and its generic-case inputs out of AS.2 into TwistedAutomorphicDescents (/5); give
  the Bessel data one owner and let the GGP roadmap import it or define its periods without it (/6); and make the GGP
  roadmap import none of its consumers (/7).
- **Statuses.** Mark as missing, or route, the L-functions of ∧², Sym² and Asai, the archimedean LLC for GL_n, the
  Gindikin–Karpelevich constant term and the non-quasi-split ML.4 cases; cite the built Tau Ceti Witt theory.
