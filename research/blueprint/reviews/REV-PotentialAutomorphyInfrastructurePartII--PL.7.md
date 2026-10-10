# Independent review of the PL.7 continuation

Issue #7844; job `REV-PotentialAutomorphyInfrastructurePartII--PL.7`.
Reviewer: Codex (GPT-6), session **codex-zKTYlL**, 10 October 2026.
The input was written by Codex session **codex-BlTjhl**, job #7840, PR #8208.
This reviewing session did not write that input.

**Accepted after corrections.** All twelve nodes are verified or corrected,
all fifteen baseline declarations are confirmed at the pins, and the packet,
reader and suggested interfaces agree. Acceptance concerns the plan. The
packet remains `complete` as a finished planning pass; PL.7 remains `planned`,
with explicit gaps and supplier contracts. No stage is marked closed and no
mathematical implementation is certified.

| Item | Reviewed result |
| --- | --- |
| Nodes | 12: 2 definitions, 10 theorems; 5 verified, 7 corrected |
| Nodes added or removed | 0 |
| Definition API / tests | 12 / 9, unchanged; both definitions checked |
| Parent PL.7 targets imported | 10, identifiers unchanged |
| Baseline declarations | 15 confirmed; none removed, replaced or added |
| Requests / gaps | 4 / 5; request scopes corrected |
| Planets | 3 new, unchanged; 6 together with the parent's 3 |
| Source findings | 8 inherited, including newly cited E61; 1 new confirmed proof gap, E74 |
| Coverage | 1 planned stage, 0 closed |

## Node checks and corrections

The following suffixes all belong to `PotentialAutomorphyInfrastructurePartII:PL.7/`.
Full per-node verdicts are also in the packet's `review.checked`.

| Node | Verdict and evidence |
| --- | --- |
| `good-cm-extension` | Verified against ANT20 §5, pp. 15–16. The definition requires a finite CM extension, soluble normal closure, disjointness from the specified avoidance field and complete splitting. The native splitting count does not silently assume Galois; the ramification/inertia compatibility test does. |
| `potentially-pro-automorphic-prime` | Verified against ANT20 §5, p. 16 and Tho15 §6, p. 64. The witness extends the Hecke kernel along the characteristic-polynomial restriction diagram. It does not require a map from the universal deformation ring to the Hecke algebra. |
| `good-extension-residual-invariants` | Verified against ANT20 Lemma 5.2, pp. 16–17 and the parent strong route. Residual-image equality preserves the actual-induction condition. Cyclotomic Schur, the CM quadratic independence and the stronger semisimplified-induction condition retain their own hypotheses. |
| `generic-potential-propagation` | Corrected: add `[L⁺:ℚ]>|R|`, needed for the fraction-field-equalising twist to be trivial at R (Tho15 Proposition 6.2, p. 65). Good extensions split R, so both sides scale by the same extension degree. The native signature now retains this inequality. |
| `connectedness-ordinary-lifting` | Corrected: retain `l^{v_l(q_v−1)}>n` at every R-place, import the finite characteristic-polynomial-subring map, and identify the arithmetic connectedness estimate as part of the parent acceptance contract (Tho15 Lemma 3.21, p. 22). The definition of connectedness alone cannot supply that bound. The sufficient `+3` bound already in the input is retained. |
| `connectedness-ring-finiteness` | Corrected: inherit the same local condition and explicitly use finite `P_M→R_M→R₁`, then quotient by the Hecke kernel and use Hecke finiteness with the norm-induced coefficient action. Finite minimal-prime quotients imply finiteness of the whole Noetherian ring, including nilpotents. |
| `weak-primitive-generic-restriction` | Verified as an honestly delimited target against Tho15 Proposition 5.3, pp. 57–58. Residual reduction gives a semisimplified induction. The arbitrary-rank bridge is an explicit gap; the source statement is not silently strengthened. |
| `weak-primitive-generic-r-equals-t` | Corrected the Tho15 Corollary 5.7 locator to pp. 62–63. Checked ANT20 Theorem 4.1, pp. 14–15 and Tho15 Theorem 4.19/Corollary 4.20, pp. 47–48. The weak restriction and d>2 patching gaps remain visible. |
| `source-primitive-ant-lifting` | Verified against ANT20 Theorem 6.1 and its proof, pp. 18–19. The degree choice is large enough for the sufficient connectedness bounds and the separate local-degree bound, without the printed half factors. |
| `source-primitive-ant-finiteness` | Corrected: remove an extraneous G7 rank-one dependency. ANT20's reducible-locus argument uses its own finite determinant quotients. Retain `S−(S_l∪{v₀})` as the unrestricted local set (Theorem 6.2, p. 20), and inherit E61 for the corresponding printed typo. |
| `source-primitive-two-constituent-lifting` | Corrected: replace PL.4 lift existence by PL.3 `ordinary-r-equals-t`, specifically its Λ-adic block-finiteness acceptance clause, followed by finite restriction. This is the input invoked in Tho15 p. 69. Keep the determinant unramifiedness condition and the full `|R|n(n+1)` dimension loss from pp. 28, 70. |
| `auxiliary-place-ant-finiteness` | Corrected: remove the same extraneous G7 dependency and clarify the local comparison request. At a split polarized place a fixed multiplier does not impose fixed determinant. Restriction must preserve `H⁰(ad ρ̄(1))=0`, for example by complete splitting. Tho24 Theorem 7.5, pp. 44–45 supplies a lifting variant; NT26 Proposition 3.9, pp. 20–21 uses the finiteness variant. Neither read passage supplies all three requested nonscalar comparisons. |

Reader corrections also identify NT21 Theorem 5.2 on pp. 67–69, **Theorem**
5.7 on pp. 72–73, and Proposition 5.8 on pp. 73–75. The Dwork-gap locator
was aligned with the first of these. The reader's signature-limitations table
records the native propagation inequality and the arithmetic conditions still
omitted from proposed theorem signatures.

## Baseline and ownership

Every cited declaration's file and statement was read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The corresponding public raw files
were also checked byte-for-byte against the shared pinned source tree.

| Confirmed declaration | Convention checked |
| --- | --- |
| `NumberField.IsCMField` | Native CM-field predicate |
| `IntermediateField.normalClosure` | Closure inside a specified ambient field |
| `IntermediateField.LinearDisjoint` | Intermediate-field/subalgebra disjointness |
| `Group.IsSolvable` | Derived-series solvability of the normal-closure Galois group |
| `Ideal.primesOver` | Set of primes over the chosen ideal |
| `PrimeSpectrum` | Ideal with primality proof |
| `Ideal.map` | Extension of an ideal |
| `Ideal.comap` | Contraction of an ideal |
| `RingHom.ker` | Kernel ideal |
| `RingHom.Finite` | Module finiteness, stronger than finite type |
| `Ideal.minimalPrimes` | Primes minimal over the given ideal |
| `Module.finite_of_surjective_of_ker_le_nilradical` | Finitely generated nilradical-contained kernel and finite quotient imply finiteness |
| `Ideal.finite_minimalPrimes_of_isNoetherianRing` | Noetherian finiteness of minimal primes |
| `NumberField.ncard_primesOver_eq_finrank_iff_of_isGalois` (Tau Ceti) | Galois scope and maximal-prime assumptions retained |
| `ringKrullDim` | Extended-natural codomain, including bottom |

No baseline replacement was needed. Module paths, roles and pins remain in the
packet. The reviewed coverage audit has no entry for this continuation or the
original potential-automorphy roadmap; it was not treated as proof of absence.

Parent and supplier statements were read for the direct prerequisites, including
the PL.3 Λ-adic finiteness contract, PL.6 restriction/twisting, polarized
characteristic-polynomial subring, generic-prime and connectedness contracts,
and the existing PL.7 targets. No new owner or ownership move is proposed.
The current TauCetiRoadmap tree at
`dea8191cc6047d6142a65872ebce6eeeb841a29b` and Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read independently of the
atlas snapshot. Searches covered the nine newer roadmap directions and the
current completed-group-algebra interfaces. None supplies these arithmetic
targets. The G7 request reuses the existing group-algebra construction.

## Sources and source findings

The exact public PDFs, hashes and reading date are recorded in `sourceVersions`.
All cited node passages were read; no source passage or sectionwise source
summary has been inserted into the repository.

| Public version | Locators checked for this review |
| --- | --- |
| [ANT20, arXiv v2](https://arxiv.org/abs/1912.11269v2) | §§3.3–6, pp. 10–20; Theorem 4.1, Lemma 5.2, Proposition 5.3, Theorems 5.1/6.1/6.2 and Corollary 5.4 |
| [Tho15, accepted manuscript](https://www.repository.cam.ac.uk/bitstreams/5b8962a1-6a0e-4d17-b5ae-b478575e1a0c/download) | Propositions 3.15/3.17, pp. 18–20; Lemma 3.21, p. 22; Lemma 3.36, p. 28; Lemma 4.16/Propositions 4.17–4.18, pp. 43–45; Theorem 4.19/Corollary 4.20, pp. 47–48; Proposition 5.3, pp. 57–58; Corollary 5.7, pp. 62–63; §§6–7, pp. 64–70 |
| [NT21, arXiv v3](https://arxiv.org/abs/1912.11261v3) | §5, pp. 66–75, including Theorem 5.2, Proposition 5.6, Theorem 5.7 and Proposition 5.8 |
| [Tho24, arXiv v2](https://arxiv.org/abs/2212.03591v2) | §7, Theorem 7.5 and proof, pp. 44–45 |
| [NT26, arXiv v2](https://arxiv.org/abs/2212.03595v2) | §3, Proposition 3.9 and proof, pp. 20–21 |
| [ANT20, published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/91B814A109E34CC8DA2A5689BFA5CFA4/S0010437X20007484a.pdf) | Theorem 4.1, p. 2415; §5, pp. 2416–2417; extension choice, p. 2419 |

The inherited findings were checked at their locators: E27 (Tho15 p. 58,
semisimplified induction), E29 (p. 28, determinant condition), E30 (p. 70,
dimension loss), E31 (ANT20 p. 15, d>2 proof completion), E32 (p. 17,
special-fibre loss), E33 (p. 19, half factors), E37 (NT21 pp. 66, 71,
rank-one scope), and E61 (ANT20 p. 20, local-set typo). The continuation
does not rely on E37's original suggested extension of Theorem 5.2: it asks
for a separate polarized rank-one class-field proof. The Dwork-family source
itself remains unread and explicitly assigned to its proposed owner.

**E74 is a newly recorded gap in the written proof.** ANT20 §5 imposes
`q_v≡1 mod l` at R, but Proposition 5.3 imports the propagation argument
using Theorem 4.1, whose condition (iii) also requires
`l^{v_l(q_v−1)}>n`. Good extensions split R and cannot improve that local
cardinality. The continuation now retains this extra sufficient hypothesis.
The preliminary extension in §6 arranges it for the global applications.
The omission occurs in both arXiv v2 and the published version of record;
the atlas register, submission history, publisher article and title/erratum
search yielded no existing repair. Its review verdict is **confirmed**, scoped
to the proof. This is not a claimed counterexample to Theorem 5.1.

## API, tests, coverage and remaining work

The good-extension API exposes the clauses, identity extension, splitting-set
monotonicity and tower composition with the enlarged avoidance field. Its five
tests distinguish bad splitting, a nontrivial extension meeting its avoidance
field, empty splitting sets and the Galois compatibility statement. The
potential-prime API supplies witnesses, upward closure, base-witness and
quotient compatibility; its four tests check empty witness indices, zero and
unit ideals, and contraction through a concrete quotient. Both have at least
three tests capable of detecting a plausible wrong definition. Their native
definitions and example signatures elaborate, with proof placeholders stated
honestly.

The twelve nodes and ten unchanged imported targets realise the planned layer.
The five gaps and four requests expose the remaining arithmetic work: the
arbitrary-rank weak-induction bridge, d>2 patching, the printed borderline
connectedness estimate, Dwork-family supplier stages, rank-one polarized
finiteness for the NT21 reducible-locus route, and nonscalar local/Hecke/patching
comparisons. None has been treated as an implemented prerequisite.

For the orchestrator: preserve those owner contracts in assembly and packaging;
route G7 only to the imported reducible-locus/generic-large-quotient consumers;
obtain Dwork owner stage identifiers when available; retain E74 and the stronger
sufficient local condition when assembling the §5 propagation route. No change
to another roadmap's files or to the parent packet was made.

Validation: `check_blueprint.py` reports **0 errors, 0 warnings**. The
source-issue and version checks pass. `lean-check` exits **0**, with **34**
warnings, all declaration uses of `sorry`. Elaboration checks the proposed
interfaces and does not establish the arithmetic hypotheses omitted from their
signatures. `git diff --check` passes.
