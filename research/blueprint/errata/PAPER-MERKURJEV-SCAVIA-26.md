# Reviewed manuscript findings: Merkurjev–Scavia

Paper: *Galois representations modulo p that do not lift modulo p²*,
J. Amer. Math. Soc. 39 (2026), 73–94, DOI 10.1090/jams/1059.
Original errata author: Claude Code, `cc-7b31c4`.
Independent reviewer: Codex, `codex-hjdg0j`, 23 September 2026.

**Eight inherited findings are confirmed, E9 is rejected, and six additional
notation findings are confirmed (E10–E15): fourteen confirmed in total.**
Individual verdicts are in the [JSON](PAPER-MERKURJEV-SCAVIA-26.json).
The [review](../reviews/REV-ERRATA-PAPER-MERKURJEV-SCAVIA-26.md) records
provenance, correction search and validation.

All verdicts concern [arXiv v1](https://arxiv.org/pdf/2410.12560v1) and the
[current author manuscript](https://www.math.ucla.edu/~merkurev/papers/Negligible.pdf),
both 21 pages. **The published JAMS text was inaccessible.** The AMS PDF
endpoints returned HTTP 403, and browser retrieval also failed. It is not
known which findings persist in the journal version. Neither accessible
manuscript supplies a later correction, and the current author publication
pages link no erratum. Page numbers below are manuscript pages.

## E1: the divisor-generator lemma

**Confirmed: error / stated result; Lemma 4.1, p.12.** Take F=R,
H=C₂ acting faithfully on the affine line by t↦−t, B=Z/2 with trivial
action, x=(t), and f_x=t. Since H_x=H, the proposed relative norm is
just the square class of t. It is not invariant: conjugation changes it by
the nonsquare −1 in R(t). If −1 were a rational-function square, clearing
denominators would give a nonzero sum of two real polynomial squares equal
to zero, impossible by its leading coefficient.

The failure also appears in the divisor map. Any square class with divisor
x modulo 2 has the form ct w² with c∈R*, so its conjugate-to-original ratio
is −1 times a square. Thus the invariant divisor generator x does not lift
to an invariant square class. The proof's left-exact sequence does not supply
such lifts; the purported generators need not even be in the invariant group.

A sufficient repair is to assume nB=0, e(H)|e and that F contains a primitive
ne-th root of unity. For h∈H_x, the ratio h(f_x)/f_x is a constant. These
ratios form a character H_x→F*, so lie in μ_e. They are n-th powers in F*,
which makes b⊗f_x invariant under H_x for every b∈B^{H_x}. The orbit
norms are therefore well-defined invariant lifts of the divisor generators.
Subtracting these lifts from any invariant element leaves an invariant
constant term by the left-exact sequence. This proves the repaired lemma.

Theorem 1.3 uses B=A(−1), n=e(A), e=e(H), and its roots-of-unity hypothesis
is exactly sufficient. The proof on pp.13–14 already verifies the character
calculation at that use. Thus this finding refutes the unrestricted lemma,
not the main theorem. The section's standing assumptions concern A; they do
not say that its integer n annihilates the arbitrary B quantified in Lemma 4.1.

## E2–E4: transgression and the coefficient sequence

**E2 — confirmed, misprint / nothing; (2.3), p.6.** For
1→Γ_L→Γ_K→H→1, inflation has target H²(K,A). The relevant five-term
segment is

H¹(L,A)^H → H²(H,A) → H²(K,A),

exact at the middle term. It is not a short exact sequence: no injectivity
of transgression or surjectivity of inflation follows. The next corollary
only uses middle exactness, and Proposition 2.1 already identifies
K=F(V)^H as the intended field. Reclassified the inherited proof-level reach
to a harmless notation slip.

**E3 — confirmed, misprint / nothing; Lemma 2.5, p.7.** The two classes
u and u′=res(u) are interchanged in the final chain. The transgression over
H′ uses −u′∪x, and its corestriction is −u∪N_(H/H′)(x). This is the
projection formula and agrees with the definitions immediately above the
chain. The lemma's square and conclusion are unchanged.

**E4 — confirmed, misprint / nothing; Proposition 3.3, p.11.** Apply
Lemma 3.4 to (3.3), not (3.2). The former is the sequence of roots of unity
with trivial H-action and boundary ∂₂, exactly as the conclusion requires.
The latter contains the Galois module L* and supplies ∂₁ instead.

## E5–E8: the matrix and weight arguments

**E5 — confirmed, error / proof; Lemma 5.3, p.15.** An element of E need
not preserve the lifted summand Ṽ. For example, with Ṽ spanned by e₁,e₂
and W̃ by e₃, the matrix I+pE₃₁ lies in E but sends e₁ to e₁+pe₃.
Consequently the claimed restriction map is not defined.

Use the top-left block A instead. Every element of E has block form
`[[A,pB],[pC,D]]`; A is invertible because it is invertible modulo p.
The top-left block of a product is A₁A₂+p²B₁C₂=A₁A₂ modulo p².
Thus this block projection is a homomorphism and induces the required
projection on the kernel matrices. It supplies the diagram in the proof and
proves the stated implication without changing Lemma 5.3.

**E6 — confirmed, misprint / nothing; Claim 5.7, pp.18–19.** The weight
of H²(Z,Z) is τ₃₁. Indeed t⁻¹(I+E₁₃)t=I+(t₃/t₁)E₁₃, and the
paper's character action is contragredient. Hence E₁₃⊗∂χ₁₃ is invariant,
as the next display correctly asserts. When p=3, τ₁₃=τ₃₁; for p>3 they
differ. In the full A tensor this character there is an additional invariant
E₃₁ at p=3, but E₃₁ does not centralize Z. This verifies the parenthetical
case distinction as well as the corrected weight. Reclassified the reach
to nothing: the subsequent calculation already uses the intended weight.

**E7 — confirmed, misprint / nothing; Claim 5.7, p.18.** E₁₂ is N-fixed
but not U-fixed, so it cannot be inserted directly in φ_U. The projection
formula uses N_(U/N)(E₁₂)⊗∂χ̃₁₂, where χ̃₁₂ extends χ₁₂ to U.
For coset representatives σ₂₃^i, conjugation gives E₁₂−iE₁₃, and thus

N_(U/N)(E₁₂)=pE₁₂−p(p−1)E₁₃/2=0

for every odd p. The class φ_N(E₁₂⊗∂χ₁₂) consequently vanishes already
before restriction. The missing norm is the sole defect in this sentence.

**E8 — confirmed, misprint / nothing; Claim 5.6, p.17.** The images of
φ_H for H⊂U generate the indicated subgroup of H²(U,A), with ambient
letter U. The source's initial N is incorrect; the claim then restricts this
subgroup from U to N, as the rest of its proof correctly does.

## E9: a correct optional remark, not an erratum

**Rejected; Remark 5.8(2), p.19.** The remark says the restriction to N is
negligible and omits its verification. This is a correct supplementary
observation, unused in the proof. The omission of a routine verification
from a remark does not establish a source mistake.

Here is a direct check under the roots-of-unity assumption used in the
preceding proof. Write a Galois representation into N as a pair of
characters χ₁,χ₂. If μ_{p²}⊂K, Kummer theory lifts each character to
Z/p²; the matrices I+χ̃₁E₁₂+χ̃₂E₁₃ then give a lift, since all products
of these two matrix directions are zero. Equivalently, the least-residue
section of N has carry cocycle

κ(a,c)E₁₂+κ(b,d)E₁₃, with κ(a,c)=floor((a+c)/p).

It represents E₁₂∪∂χ₁₂+E₁₃∪∂χ₁₃, a sum of the generators in
Theorem 1.3 for ambient N. It can be nonzero in finite-group cohomology,
as Claim 5.4 proves, while still being negligible for absolute Galois groups.

The assertion even holds without μ_{p²} in the field. After the extension
K′=K(μ_p), of degree prime to p, let c be the mod-p² cyclotomic character,
so c≡1 mod p. Kummer theory lifts χ₁,χ₂ to μ_{p²}-valued cocycles
b₁,b₂: its map on H¹ is the surjection K′*/K′*^{p²}→K′*/K′*^p.
The matrix with first row (c,b₁,b₂) and lower two rows (0,1,0),(0,0,1)
is multiplicative by the cocycle identities and reduces to the prescribed
N-representation. Restriction/corestriction then kills the original
p-torsion obstruction over K, since [K′:K] is prime to p. This also removes
any ambiguity about retaining the preceding proof's roots-of-unity assumption.

## Additional notation findings

All six below are confirmed **misprints affecting nothing**, checked in
both manuscripts and in page images.

| ID | Locator | Correction and reason |
| --- | --- | --- |
| E10 | After Theorem 1.3, p.4 | Reverse the action phrase: H acts trivially on A. A is the coefficient H-module; no action of A on H is given. |
| E11 | Example 2.2, p.5 | Use K*/K*^{mn}→K*/K*^m and Γ_K for every extension K/F. The displayed H¹ groups are over K, and negligibility requires all such K. The identical Kummer argument works over each. |
| E12 | End of Lemma 4.1 proof, p.13 | Replace the sum's upper limit k by r=[H:H_x], the number of representatives fixed on p.12. There is no k in this construction. |
| E13 | End of p.13, Theorem 1.3 proof | Replace Div(X) by Div(V). The cited sequence (4.2) concerns V and x was chosen in V^(1). |
| E14 | Theorem 5.1 proof, pp.15–16 | First push the coefficient module b_n into gl_n, as in Lemma 2.3(1); the resulting class is subsequently identified with a restriction from GL_n to B_n. H²(B_n,gl_n) is not a subgroup to which (5.2) is restricted. |
| E15 | Lemma 3.2, p.8 | Use fL*^n for the Kummer class, and call L[t]/(t^n−f) a finite étale L-algebra (also over K). The printed fL* is always trivial, while F is not a field named in this lemma. |

These corrections repair the identified manuscript passages. They do not
constitute a certification of all arguments or external inputs in the paper,
and no claim is made about uninspected journal text.
