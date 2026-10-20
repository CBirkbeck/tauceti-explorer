# Independent package review: FunctionFieldArithmetic

**Verdict: accepted.** Codex, session `codex-ofOFBJ`, 2026-10-20; issue #11489.
I did neither the original package nor its fix. This reviews the package after
`FIX-PKG-FunctionFieldArithmetic~adv1`, against the earlier independent report
`REV-PKG-FunctionFieldArithmetic.md`.

The earlier report's remaining finding 11 is closed. Sections 4.6–4.10 now supply
the rigidified Picard construction, fixed-modulus universal property, idele comparison,
Lang covers, connectedness, finite ray classification and least conductors. Ordinary
Picard theory alone is no longer presented as supplying this geometry. Findings 1–10
and 12–23 remain corrected. I added precise Rosen, Goss and Stichtenoth locators;
no further mathematical correction was needed.

## Construction and ownership

I read the complete README and Suggested file, the accepted 48-node packet and reviewed
FA.0–FA.7 library audit. Each accepted target remains either a target here or an explicit
consumed contract. The two previously incomplete nodes, ray/generalized Picard comparison
and geometric abelian existence, are supplied by §§4.6–4.10. Computational targets remain
in §§1.3, 4.5 and 5.8–5.9. The packet's historical gaps are unchanged.

The new construction covers every perfect field in §§4.6–4.7 and every finite exact
constant field in §§4.8–4.10, in every characteristic, without a rational-point hypothesis.
It includes zero and nonreduced moduli. Nonzero rigidification removes scalar
automorphisms; the zero-modulus functor retains the Picard–Brauer distinction.
The high-degree Abel bundle yields the modulus relations and descent. Finite Artin
reciprocity is applied to the actual generic finite image before connectedness is
known; approximation identifies its map, and the degree-zero image proves geometric
connectedness. Thus geometric existence does not assume arithmetic existence.

I checked the actual supplier statements: SF.1 T159–T160, SF.3c T353–T356 and SF.3d T359;
JacobianChallenge A–C; RG2.0a and RG2.3.7; AGD R02.3.2; and AL.3. None requires a theorem
from GlobalShtukasAndFunctionFieldLanglands or a later roadmap for this construction.
There is no `UPSTREAM:` or FoundationsAndLibraryIntegration supplier. Layer 7 retains
its separate, explicit odd-characteristic FYZ hypotheses; these do not restrict the
global arithmetic of Layers 0–6.

The models were AlgebraicCurves and completed RestrictedProducts. I checked the pinned
declarations and searched current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27`
and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including all nine newer roadmaps
and the four completed additions, by mathematical objects and hypotheses. Existing
constants, divisors, completions and the one-pole genus theorem remain consumed in the
boundaries. LocalGaloisGroups' local reciprocity has mixed-characteristic hypotheses;
it does not supply this equal-characteristic existence theorem. No additional duplicate
target was found or removed.

## Sources

For the earlier unresolved construction I read Guignard §4.7, Proposition 4.8, Lemma 4.9
and Propositions 4.11–4.14 with proofs, pp. 1317–1321; Russell §3.3, Theorems 3.24–3.25,
p. 34; Conrad's four-page geometric handout; and Milne ADT A.7–A.12, pp. 131–136.
Guignard supplies representability and Abel-bundle arguments for nonreduced moduli.
The README gives the descent and finite-Artin deductions rather than attributing them
to a bare classification statement. ADT is used for finite reciprocity, not existence.

The independent random sample is `random.Random(11489).sample(headings, 15)`, where
`headings` is the numbered `### k.n` subsections in document order. All locators below
were opened and read; no sampled locator required correction.

| Subsection | Primary source region checked |
| --- | --- |
| 5.6 | Roquette §4.3.3, p. 28; Newton recovery checked algebraically. |
| 4.9 | Conrad, Theorem 3.2, p. 4; RG2.3.7's smooth connected Lang statement. |
| 5.7 | Stacks Tag 03UZ, Theorem 64.20.1; Abdurrahman–Venkatesh §3.2, p. 27. |
| 4.5 | Conrad §2, pp. 1–3; Kosters–Wan §4.2, pp. 14–16; Yoshida §7, p. 434. |
| 5.5 | Roquette equation (4), p. 22; constant-extension formula checked from place degrees. |
| 2.1 | Parshin §§2.1–2.2, pp. 7, 9–10. |
| 3.1 | Kosters–Wan Proposition 3.1, Theorems 3.2 and 3.4, pp. 6–9. |
| 3.3 | Kosters–Wan Theorem 3.2 and Proposition 4.3, pp. 6–8, 15. |
| 4.6 | Guignard §4.7, Proposition 4.8 and Lemma 4.9, pp. 1317–1319. |
| 2.2 | Parshin §2.2, pp. 9–10. |
| 0.1 | Yu §§2.2.1, 2.2.3, pp. 8–9. |
| 5.9 | Hess Theorem 7 and Proposition 9 with proof, pp. 6–8; residue-condition computation checked separately. |
| 5.2 | Roquette §4.3.3, p. 27. |
| 4.8 | Conrad §2 and Theorem 3.2, pp. 1–4; Guignard's rigidified functor. |
| 6.6 | Böckle–Harris–Khare–Thorne §8.1, pp. 34–35. |

The added book locators were read in lawful publisher previews: Rosen Chapter 5,
pp. 45–46; Goss §1.1, Example 1.1.1 and Proposition 1.1.2, p. 1; Stichtenoth §5.1,
Lemma 5.1.1, p. 185 and Definition 5.1.2/Proposition 5.1.3, p. 186. I did not read or
claim access to their full books, nor to the original SGA 4½ proof behind Stacks 03UZ.
All additions are in my own words.

## Adversarial mathematics and Lean

I checked the layer statements and definition APIs against their Checks; every definition
retains at least three discriminating README checks. The following records the principal
boundary and normalization calculations. All passed; no statement was weakened.

| Statements | Instances and result |
| --- | --- |
| Exact constants, degrees, Riemann–Roch and zeta | Nonexact `𝔽_{q²}(t)/𝔽_q` is excluded where required; `g=0`, `n=0` gives `A₀=1`; `ℙ¹` has numerator 1 and `N_r=q^r+1`. No finite field has `q=1`. |
| Divisor lattices and Fourier measures | `2∞` uses the inverse infinity ideal; local volume `q_v^(−ord_v(ω)/2)` and annihilator `A(K_ω−D)` give global volume `q^(deg D+1−g)`. |
| Witt classes, local reciprocity and conductors | Length zero, coboundaries, `p=2`, constant-only classes and upper-unit depth below a pole retain the actual class order, constant part and nonnegative clamp. |
| Rigidified Picard and Abel bundles | On `ℙ¹`, zero modulus gives zero Jacobian, two points give `𝔾_m`, a doubled point gives `𝔾_a`; a degree-two point gives a nonsplit torus. The real-conic check distinguishes ordinary Picard points from actual rigidified bundles. |
| Local-unit and Frobenius signs | Over `𝔽_5`, unit 2 maps to inverse 3. Tame Lang gives `z^5=2z` at `t=2`; additive Lang gives `y³=y+1` at `t=1`. A degree-two place verifies the factor `deg(v)` in `[v]−deg(v)a`. |
| Ray classification and least modulus | Constant covers have conductor zero; tame `z^(q−1)=t` has two tame places for `q>2`, but is identity at `q=2`; `y^q−y=t` has conductor `2∞` including `q=2`. The map `2deg` into `ℤ/4` gives two quadratic components. |
| Finite coefficients and Chebotarev | Determinants use the compact-support perfect complex; projective cohomology is an additional hypothesis. Constant extensions impose the degree congruence and geometric-group denominator. |
| Automorphic functions and Satake | A torus without the central degree quotient is infinite; nonabelian averaging uses weighted double cosets. The `GL₂` constant function gives `q+1`, fixing `δ_P^(−1/2)` for right convolution. |
| Unitary Fourier and density formulas | Rank zero, split cross-duals, the length-one overlattice, rational versus adelic Levi covariance and the two constant-term exponents preserve the prior sign, domain and half-length corrections. |

I compared all eight admitted theorem signatures and the seven real-bodied definitions
with the README, including exact constants, the large-degree inequality and Newton signs.
The 279-line Suggested file contains only native-carrier statements and proved definition
examples, with at most two per definition; heavy carriers remain named README targets in
its closing comment. No data definition or example is admitted. The import block is correct.

`lean-check` exited 0 at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`: eight `sorry` warnings, no errors or other warnings.
Suggested.lean and metadata are unchanged. Packet validation, intake and whitespace checks
passed. There is no unresolved package defect or remaining review work.
