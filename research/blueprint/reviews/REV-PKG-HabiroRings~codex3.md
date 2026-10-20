# HabiroRings: independent boundary re-review

**Accepted.** Issue #11437, `REV-PKG-HabiroRings~codex3`; Codex, session
`codex-ipH6jo`, 2026-10-20. This reviewer did not write the package or its fixes.
The three outstanding items in [the preceding review](REV-PKG-HabiroRings~codex2.md)
are now closed by the checked-out sibling files. No mathematical package edit
is needed. This verdict preserves the explicit solid spectral and actual
arithmetic-line supplier conditions; it does not assert their implementation.

| Previous blocker | Independent check of the current files | Result |
| --- | --- | --- |
| R1: HC owned the derived comparison and imported HR.2 | HC scope, §5.5, Layer 5 dependencies and downstream exports now contain only the ordinary module construction. HR §2.4 owns `ordinaryDerivedComparison` and consumes HC's earlier factorial, Laurent and polynomial-module results. | Closed. No reverse construction input from HR to HC. |
| R1a: the purported decaying family | HC §5.5 uses the diagonal map with entries P_k and the family (P_k). Modulo P_N its support is contained in {1,…,N−1}; the only possible inverse family is all ones, which fails finite support modulo P₁. The rejected ((q−1)^k) has nonzero entries (−2)^k modulo Φ₂. | Closed, including the failure of middle exactness. |
| R2: RT's stale HR.6 cohomology owner | RT §6.14 imports HCF §4.21 and its §4.28 export `HabiroHodgeDescent.etale`, then HR §5.9 for the number-field ring. The pair is the empty-framed, h-adic étale pair. | Closed. The separate spectral hypothesis 6∣Δ remains. |

Here an arrow means **supplier → consumer**. The construction order is
HC → HR → HCF → RT, with additional forward HC → HCF and HR → RT inputs.
The order in the issue's displayed family list is not this arrow convention.
HCF's scope, supplier contracts and §§4.21/4.28 consume HR.1–HR.5; its RT
mentions describe downstream consumers. HR's HCF/RT references likewise
describe consumers, not prerequisites. Thus these four packages have no
construction cycle through HR. This is not a certification of every other
package in the Habiro/cohomology/trace family.

The README, Suggested.lean and metadata are byte-for-byte unchanged from
`f0d36af2e`, the preceding independent review. All **89 accepted packet entries,
294 original API names and 131 original named Checks** remain represented,
including the explicitly downstream-owned étale comparison. The additional
§2.4 receiver remains present. The README is 199,855 UTF-8 bytes; its 90 unique
explicit anchors and 244 resolved local Needs edges form an acyclic graph.
There are no unresolved local reference targets or newly flagged source locators.

The following adversarial checks were repeated against the unchanged contracts.
They supplement the preceding review's target-by-target pass.

| Targets and conventions | Boundary calculation / constraint retained |
| --- | --- |
| Witt/Λ supplier interfaces and HR.1 | Torsionful coalgebras are not replaced by Adams-only data; Δ(2)₂=−1 fixes Witt comultiplication. The p-unit case gives zero completion. Completed Frobenius is semilinear and need not be an automorphism. |
| HR.2, especially §2.4 | P₀=1 gives zero quotient; positive Laurent factors remain regular for M=𝔽₂. The first two factorial quotients have ranks 1 and 3 over M. At m=0 regularity fails; on arbitrary 𝔽₂ with q=1 the derived quotient has an extra suspended 𝔽₂. Surjective quotient towers, not coefficient flatness, give staticity. |
| HR.2 solid targets | The spherical finite stages have ranks 1 and 3. P_aP_b∣P_(a+b) has the stated direction; at a=b=1 the extra factor is 1+q. No division at q=1 is used. Full spectral product/tower/balanced-tensor hypotheses and both bounded-below conditions remain explicit. |
| HR.3 | Singleton descent is the identity; m=6 has four prime edges. Two copies of a category with zero overlap would fail descent and are excluded by the overlap condition. Mapping spaces retain paths; localization retains its subsequent completion. |
| HR.4, especially §4.6 | With B=ℤ, f=2 and D=𝔽₂ the lift is ℤ₂. For regular f and B/f≠0, the static quotient B/f has π₁=B/f after derived reduction and cannot be the deformation. Unit f gives the zero ring; f=0 on ℤ is excluded by regularity. Markings and coherent Frobenius transitions remain data. |
| HR.5 | Zero/self pairs, split finite étale root algebras and completed polynomial base change distinguish the full Taylor equalizer. Discriminant support suffices for the ring theorem; no inversion of 6 is imported from the later line application. |
| HR.6 | The actual integral evaluator has a preimage of 1. Zero evaluation fails; negated evaluation sends 3 to −3. No R→H constant embedding is assumed. The completed-line result allows arbitrary commutative R, while the HB.7 global line and inverse-tensor certificates remain hypotheses. |
| HR.7 and downstream comparison | ℤ[1/p] is distinct from ℤ_(p). Modulo 5, x³−2=(x−3)(x²+3x+4), with the quadratic irreducible; local Frobenius does not supply a global cubic automorphism. Étale cohomology uses HCF's smooth-form and descent inputs, not scalar completion alone. |

Source sample: 15 accepted targets, sampled without replacement using seed
11437. Each displayed locator was read directly; no new correction was needed.
Source abbreviations and editions are those of the package References.

| Sampled target | Confirmed locators |
| --- | --- |
| HR.7 inverting a prime | Q 2.7, p.15; Remark 2.8, p.16. |
| HR.1 Wilkerson comparison | B §1.17, pp.12–13; H Proposition 1.19, p.17, Lemma 1.24, p.19. |
| HR.2 derived Nakayama | Q Lemma B.3, p.78; Remark B.5, p.79. |
| HR.4 restriction obstruction | W 1.3, p.3; Proposition 2.14, p.13. The specified compatible diagram and nonzero scalar p matter. |
| HR.2 two-term resolution | Q proof of B.2, pp.77–78. The README retains its corrected inverse-factorial augmentation. |
| HR.2 factorial completion | Q B.1 and B.2(c), p.77. |
| HR.3 finite localization | Q proof of Lemma 2.2, p.14, and Corollary 2.4, pp.14–15; Stacks tag 0920, second proof, for finite dualizable Koszul towers. |
| HR.6 completed regulator | Q 1.4, p.4; G Proposition 1.5(f), p.11, proof in §3.3, p.45. |
| HR.1 prime-local free presentations | Q 1.22(e), p.12; H Lemma 1.4 and Proposition 1.8, pp.8–11. |
| HR.6 order-one fibre | G Definition 1.4/Theorem 2, p.10, Proposition 1.5(f), p.11, §3.3, p.43. The integral evaluator remains an explicit supplier condition. |
| HR.3 fracture pieces | Q Remark 2.5, p.15. |
| HR.2 completed countable free modules | Q proof of B.8, p.80; Bosco Lemma A.4, p.93. The latter is abelian, not the entire spectral contract. |
| HR.3 complete descent | Q Corollary 2.4, pp.14–15. |
| HR.2 solid unit | Q B.8, pp.79–80; T §5.3, printed p.86/PDF p.90. Compact generation alone does not discharge the supplier contract. |
| HR.4 relative q-Witt | W 2.40–2.41, p.30; 2.44/2.46, p.31; 2.47, p.32. |

For the receiver, also read Habiro §7.1, Proposition 7.1 and the Laurent
comparison, pp.1141–1142, and §7.3, p.1144. The receiver derives its comparison
using regularity and the surjective countable tower; it does not attribute the
whole derived statement to Habiro. All eight freshly downloaded public PDFs
(Q, W, H, B, G, Bosco, Habiro, T) have the same SHA-256 receipts recorded in the
preceding review. No source passages were added to the repository.

Pinned Mathlib/Tau Ceti source signatures were checked for formal-smooth
complete lifting, unramified uniqueness, discriminant/unramifiedness,
invertible-module bijectivity, power-series units and all-conjugate cyclotomic
lifting. Ten Lean-to-README checks cover the six admitted milestones, the
real evaluator definition, its zero control and its two normalization examples.
The arbitrary-ring and positive-index hypotheses agree. All heavy carriers
remain in the README and are named in the closing Lean comment.

Current upstream roadmaps (including the nine additions and Completed) and
current Tau Ceti were searched by objects, operators and hypotheses. The nearby
AdicSpaces, DGAInfinity and AlgebraicVectorBundles contracts, finite Noetherian
adic-module completeness and Adams-graded DG completion were inspected. None
supplies these relative all-cyclotomic, solid spectral or completed-fibre targets.
No duplicate was removed. Checkout commits and validation details are in the
[handoff](../handoff/REV-PKG-HabiroRings~codex3.md).

Validation: Suggested.lean has 210 lines and elaborates with **exit 0, no errors,
six `declaration uses sorry` warnings only**. Seven examples and the zero
evaluation theorem are proved. All six packet validators report zero errors
and warnings; intake file checks and `git diff --check` pass. Remaining work
for this issue: none.
