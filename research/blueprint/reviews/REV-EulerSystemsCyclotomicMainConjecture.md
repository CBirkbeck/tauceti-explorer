# Independent review: Euler systems and the cyclotomic main conjecture

**Verdict: accepted as a complete target-level planning pass, with four explicit
gaps.** Reviewer: Codex, session `codex-74m6xC`; job
`REV-EulerSystemsCyclotomicMainConjecture`, issue #402; 19 October 2026. This
session did not write the blueprint being reviewed. Acceptance does not close
the remaining mathematical obligations or assert that the targets are
formalized.

## Scope and counts

Every target, hypothesis, proof sketch, source locator, prerequisite, API and
definition test was checked. The packet records an individual verdict for each
node: **56 verified, 19 corrected, none added or unverifiable**. The reader and
suggested file were corrected in the same pass.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| L0 | 31 | 6 | planned |
| L1 | 7 | 1 | planned |
| L2 | 4 | 1 | planned |
| L3 | 7 | 2 | planned, G1 remains |
| L4 | 26 | 4 | planned, G2–G4 remain |
| Total | 75 | 14 | no stage closed |

The inventory has 32 lemmas, 25 theorems, five comparisons, 12 constructions
and one definition. All 13 definitions/constructions retain at least three
discriminating tests. There are **55 API entries and 56 tests**, increases of
three and one respectively. The target density and existing node ids are
retained; proof steps have not been expanded into auxiliary lemma nodes.
The 29 baseline citations are confirmed, all 22 source issues have confirmed
individual reviews, and 12 precise supplier requests remain open.

## Sources and baseline

The public versions read are recorded with hashes in `sourceVersions`:

- [Rubin's public author draft](https://swc-math.github.io/notes/files/99RubinES.pdf):
  the cited passages in Chapters I–IV and IX and Appendix D, with the packet's
  printed-page locators. The published book was not used.
- [Rodrigues Jacinto–Williams, arXiv v2](https://arxiv.org/pdf/2309.15692v2):
  the cited passages in §§2.2.4, 7, 10–13 and Appendix B. The relevant
  corrections were also checked in the
  [published article](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf),
  pp. 171 and 197–198 (§§10.5, 13.5).
- [Greither, Annales de l'Institut Fourier 42 (1992)](https://www.numdam.org/item/AIF_1992__42_3_449_0/):
  the cited statements and proof passages in §§1–4, printed pp. 449–499.
- [Gross, *p-adic L-series at s=0*](https://repository.dl.itc.u-tokyo.ac.jp/record/39628/file_preview/jfs280340.pdf):
  Conjecture 1.15, Proposition 1.16 and §4, printed pp. 982–983 and 990–994.

Every one of the 29 `baseline.declarations` was read in its stated module at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. No declaration was removed or
renamed. Two `provides` descriptions were narrowed:

- `Representation.averageMap` requires invertible group cardinality.
- `NumberField.Units.finrank_eq` gives the additive unit rank. The character
  multiplicities of the Galois-module unit theorem remain an explicit request
  to `IntegralIwasawaTheory:L0`.

The remaining citations provide the stated cyclotomic degree, root, norm,
invariants, finite-sum, power-series and finite Kummer ingredients. They are
not used as substitutes for inverse-limit Kummer theory, completed unit
modules or arithmetic characteristic-ideal theorems.

## Corrections

The following list accounts for all 19 changed nodes; all other nodes have a
specific verification note in the packet's `review.checked`.

1. **L0/chi-component:** scalar regularity in the coefficient ring alone does
   not kill a trivial-action eigensubmodule. Require injectivity on the module,
   and test the sign character on ℤ/2. State the coefficient and splitting
   hypotheses for decomposition. Add extensionality and the trivial-action
   criterion to the API.
2. **L0/chi-sum:** add compatibility with equivariant linear maps, also stated
   in the suggested file. The sum remains unnormalized.
3. **L0/chi-cyclotomic-generator and L0/twisted-class-formula:** state the
   inherited odd-prime convention for the tower indexed inside
   ℚ(μ_{p^{n+1}}); the dyadic tower is treated separately in L4.
4. **L1/selmer-is-class-group:** correct “relaxed” to “strict” and preserve the
   subscript/superscript local-condition distinction (Rubin I.6.1,
   pp. 13–14; III.2.3, p. 36).
5. **L1/mazur-wiles-chi-equality:** make the proof order explicit. Factors with
   ψ(p)=1 use the later unramified Gras theorem; L2 needs only the earlier
   divisibility, so the internal graph remains acyclic. Keep the
   general-conductor class-number product as a precise supplier request
   (Rubin III, Corollary 2.4, p. 36).
6. **L4/greither-semilocal-units:** rationalization is Λχ[1/p], not the full
   formal series ring with field coefficients. The latter loses, for example,
   the factor T−p. Preserve bounded denominators throughout the comparison
   (Greither, Corollary 2.14, p. 465).
7. **L4/greither-gauss-sum-vectors:** do not invoke Gross Conjecture 1.15 as a
   proved nonvanishing theorem. The abelian algebraic route uses §4 and
   Proposition 1.16; its supplier's missing argument remains G3.
8. **L4/greither-relative-class-group-bound:** distinguish the quotient by the
   image of the real class group from the minus subgroup. The latter
   identification is used only on the indicated nontrivial prime-to-2
   character part. The lower bound can be fractional for a pure 2-power
   character. Treat that case first with the analytic formula and its
   capitulation factor, without assuming the later proof that this factor is
   one (Greither §§1, 4, pp. 453 and 482–484).
9. **L4/greither-iwasawa-leopoldt-two:** an order formula does not imply that a
   finite character module is cyclic. Its DVR length gives the required
   annihilator bound. A direct sum of two residue fields rejects the original
   inference (Greither, Theorem B implies Theorem A, pp. 453–454).
10. **L4/greither-ray-class-real-fields:** restrict the finite character formula
    to χ₀≠1; the trivial character has the excluded pole (Theorem 4.11,
    pp. 493–494).
11. **L4/greither-ray-class-transfer:** the inertia argument gives total
    ramification in the relative cyclic p-extension F/K, rather than F/ℚ.
    A cyclic sextic compositum with inertia orders two and three shows the
    difference (Lemma 4.13, p. 495; new E20).
12. **L4/greither-coleman-sequence-all-p:** insert component units into the
    product by using 1−e_i+e_i(1−X) and 1−2e_i. A bare idempotent multiple
    need not be a global unit (Theorem 2.4–Corollary 2.7, pp. 457–459).
13. **L4/greither-semilocal-coleman-map:** use i+t, with t=2 at p=2, in both
    local levels and evaluations. The dyadic root kernel uses the signed
    norm-compatible tower; the unsigned root has the wrong norm (Theorem
    2.8, p. 461; new E21).
14. **L4/greither-circular-unit-generators:** nonzero does not mean basis over
    a product of coefficient fields. Use the already-owned unit-measure
    Amice equivalence and dilation compatibility, with a normal basis on each
    character factor. Add these precise supplier prerequisites (Lemma 2.11
    and Corollary 2.12, pp. 463–464).
15. **L4/greither-stickelberger-image:** separate the pure cyclotomic case
    m=1. For p=5, ρ=ω² is even and nontrivial but trivial on Δ; the cited
    nontrivial-Δ generator lemma does not apply. Import the existing Coleman
    image and adjusted-generator formulas; their sign, inversion and Tate
    twist comparison with Greither's series remains G4 (Theorem 2.13,
    pp. 465–466; new E22).
16. **L4/greither-chebotarev-at-two:** retain the extra factor two in
    γ₁=2 Art(c). The restriction is 2^{h+2} Art(c), and the cyclotomic
    complement gives 4 Art(c), as the source theorem requires (Theorem 3.7,
    p. 473).
17. **L0/unsmoothed-cyclotomic-euler-system:** the norm of bℓ from the real
    field is ℓ for odd ℓ, while the full cyclotomic-field norm is ℓ²;
    b₂=4 is separate. The raw family still fails the finite local condition
    before twisting (Rubin IX, Example 1.1, pp. 134–135).
18. **L4/relative-class-group-bound-odd:** restore faithfulness on the cyclic
    p-Sylow subgroup. Descent through ker χ is then through a prime-to-p
    extension, without assuming exactness across a p-extension (Greither,
    Theorem 4.1, pp. 482–484).

All 19 existing source issues E1–E19 were checked and confirmed, including the
published RJW comparisons. Three additional defects in Greither's proofs are
recorded as E20–E22 above. E22 diagnoses a missing proof case, not a
counterexample to Theorem 2.13. Searches of publication metadata and correction
records located no matching correction; the packet records the search scope.
Every source-issue description is in the reviewer's own words.

## Ownership, closure and follow-up

The reviewed library audit was checked against this scope. The current
ProfiniteArithmetic and LocalGaloisGroups READMEs were read, together with
their relevant Suggested signatures; the nine newer roadmap areas and current
Tau Ceti completed-group-algebra and cyclotomic APIs were screened. Completed
algebras, local multiplicative modules, reciprocity and generic Euler-system
theory remain imports. The circular-unit image correction imports existing
Coleman L4 targets instead of planning another Coleman theory.

All cross-roadmap suppliers were checked at their stated targets. In
particular, **RT-AREA-iwasawa-1/21** is satisfied by the direct
`SelmerIwasawaCohomology:L4` Tate-twist dictionary prerequisite.
**RT-AREA-iwasawa-1/36** is satisfied by direct ES.2 carrier/twisting imports,
ES.1/ES.3 local and derivative inputs, ES.4 finite bounds and ES.8 Iwasawa
bounds. The reader also records Kato's corresponding ES.2, ES.4 and ES.8
ownership boundary; no Kato files were changed.

Four obligations remain for the orchestrator to route or retain in packaging:

- **G1:** bounded circular-unit norm descent and the general-conductor
  finite-layer comparison; the class-side control is already imported.
- **G2:** a read proof of the odd-prime split valuation/logarithm lattice and
  finite-level comparison in Greither Theorem 4.1.
- **G3:** the nonzero Gauss-ideal projection and algebraic logarithm comparison
  still missing in the precise Dirichlet nonvanishing supplier.
- **G4:** the pure cyclotomic Coleman/Stickelberger normalization comparison,
  requested from the existing Coleman L4 and Dirichlet L2 owners.

No ownership move or further node is requested. Under PROTOCOL §0, these
recorded gaps are compatible with `planned` stages and a `complete` planning
pass. None of the stages is claimed closed. The displayed internal dependency
graph is acyclic, including the L1 finite-equality corollary's later L4 input.

## Validation

`python3 scripts/check_blueprint.py
research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json` reports
zero errors and zero warnings. The corrected 160-line suggested file
elaborates using `lean-check` at the pinned libraries: exit zero, with only
17 `sorry` warnings. Its two light definitions have real bodies; no data
definition is admitted. The reader contains all 75 target anchors and mirrors
the corrected statements, hypotheses, proof sketches, APIs, tests, requests,
gaps and source-issue verdicts. The diff contains only this job's deliverables
and handoff note.
