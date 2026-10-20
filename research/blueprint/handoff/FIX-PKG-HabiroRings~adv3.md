# FIX-PKG-HabiroRings~adv3 — completed receiver repair

Issue #11403. Codex (GPT-6), session `codex-L9C5kZ`, 2026-10-20.
Claim confirmed by the bot on comment 6291340826. This completes the
HabiroRings deliverables of this fix; it is not a checkpoint or an
independent review of these changes.

## Findings and dispositions

The requested `REV-PKG-HabiroRings~adv.md` is absent. The available
`REV-PKG-HabiroRings.md` accepts the package with explicit supplier
qualifications. The preceding repair is documented in
`FIX-PKG-HabiroRings~adv.md`. Its scalar exports, conditional solid
comparisons, completed base change, discriminant/6 distinction, descent
overlap identity and compact Lean file are preserved. No unavailable
adversarial finding has been invented.

The concrete new findings are R2 and its QSeries clause in
[the Part II review](../reviews/REV-PKG-HabiroCohomologyFoundationsPartII~codex1.md)
and its matching handoff. That review identifies the donor as
**HabiroCyclotomicCompletions (HC) §5.5**, not
HabiroCohomologyFoundations. The former actually contains both the named
comparison and the Layer 1 factorial API. The issue's package name is
therefore read against these exact locators.

| Finding or requirement | Disposition in the authorized files |
| --- | --- |
| R2: HC's ordinary/derived comparison consumes its own consumer HR.2 | Received `ordinaryDerivedComparison` in HR §2.4, immediately after the completion adjunction. Specified the comparison, its homotopy, finite projections and naturality, with a proof route through regular Laurent factors and a surjective countable quotient tower. HC contributes only its ordinary classical input. |
| R2: retain the coefficient-module generality and derived checks | The result applies to every commutative coefficient ring B and every B-module M, including integer torsion. Added six named checks: zero/empty factorial, integral unit, characteristic two, excluded order zero, q=1 torsion, and coefficient reduction. |
| Higher QSeries supplier for factorial divisibility | Replaced the sole QM.0 input by HC Layer 1 §1.1 `qBinomial_factorial` and `qFactorial_pochhammer`. The resulting polynomial identity is transported from ℤ to any commutative B. No Gaussian definition is duplicated. |
| Divisibility direction and specialization at vanishing factors | Replaced quotient notation in the two-factor check by P₂=P₁²(1+q). Added the reverse-divisibility failure at q=−1 and the q=1 values over ℤ and 𝔽₂. All three computations have proved Lean examples. |
| Suggested signatures on actual pinned carriers | Added the Laurent regularity milestone on `LaurentPolynomial B ⊗[B] M` and the factorial-divisibility milestone on `B[X]`. The derived comparison remains a full README target because its enhanced completion carrier is absent at the pins. No placeholder proposition or admitted data definition was introduced. |
| No backward cohomology input | Scope, exact contracts and Layer 2 dependencies specify HC's ordinary input independently of HR's comparison. No cohomological or trace construction supplies the comparison or factorial identity. |
| Original package coverage and shape | All 89 existing target anchors remain; the receiving target adds one anchor. Existing API and named checks remain. Layer 2 is renumbered consecutively; old §2.13 is now §2.14. Existing explicit anchors and links are unchanged. |
| R1, R3 and R4 of the cited Part II review | These concern Part I/RT trace ownership and stale RT comparison inputs. They are outside this issue's files. No such supplier edge was added to HR. The prior scalar-package downstream comparison specification is preserved. |

## Donor and family handoff

The maintainer's HC repair must remove `ordinaryDerivedComparison` and
its derived checks from HC §5.5, and remove the resulting HR construction
input from HC's Scope and ownership, Layer 5 Dependencies, §6.4, Layer 6
summary and closing Suggested.lean comment wherever it occurs. Point any
downstream use of the comparison at
[HR §2.4](../packages/HabiroRings/README.md#hr-2-ordinary-derived-comparison).
Keep HC's ordinary polynomial-module completion/exactness and its
arbitrary-module boundary. No HC file is authorized here, so this PR is
the receiving half of that coordinated move. It does not certify that the
five whole packages are already acyclic. After all the review's moves,
the conditional supplier-first order is HC → HR → Part I → RT → Part II.

One additional donor correction is needed when preserving that ordinary
boundary: the current HC §5.5 family ((q−1)^k) is not Habiro-decaying.
Modulo q+1 its kth coordinate is (−2)^k, nonzero for every k, whereas a
completed direct sum must have finite support at that finite quotient.
Thus that family cannot establish the claimed full-completion example.
A replacement can use P_k in place of (q−1)^k in the diagonal maps and
family: P_k is eventually divisible by every fixed factorial P_n, while
the putative preimage has constant coordinates one and fails finite
support modulo P₁. Cancellation coordinatewise uses the classical
integral Habiro domain. The donor worker should write and verify this
ordinary example there. This observation is a mathematical finding in
out-of-scope data, not an instruction to edit another package. HR's new
negative control instead uses the explicit derived cofiber on 𝔽₂ at q=1
and does not repeat the faulty family.

## Adversarial pass on touched mathematics

The following pass covers the new statements and conventions, their
scope/contracts/Examples repetitions, and the changed factorial input.
The prior repair's 89-target pass remains in its handoff; this is not a
claim to have independently re-reviewed every unchanged target.

| Statement or convention | Instances and calculation | Result and change |
| --- | --- | --- |
| Polynomial coefficient module N=B[q,q⁻¹]⊗_B M | M=0; B=M=ℤ; B=ℤ, M=ℤ/2; B=M=𝔽₂; zero coefficient ring | No flatness or torsion-free assumption is needed. The zero cases are zero throughout. README and Lean have the same arbitrary commutative-ring/module generality. |
| `OrdinaryDerivedComparison.laurent_regular` | m=1,2 and finite Laurent support with largest exponent j | At exponent j+m the coefficient is the original nonzero coefficient at j. A zero-divisor coefficient ring does not change that coefficient. |
| Positive order hypothesis | m=0 on 𝔽₂[q,q⁻¹] | The operator is zero on a nonzero module; 0 and 1 have the same image. Positivity is explicit and the negative control is proved in Lean. |
| Characteristic-two regularity witness | (q−1)·1 over 𝔽₂; q²−1=(q−1)² | Coefficient at q is one. Repeated factors do not prevent injectivity on the Laurent coefficient module. The nonzero witness is proved in Lean. |
| Derived factorial quotient is static | P₀=1; P₁=1−q; P₂=(1−q)(1−q²) | Products of injective factor operators are injective. P₀ gives zero; positive stages give ordinary quotients, with no degree-one kernel term. |
| Finite quotient basis and sign | n=1,2 have ranks 1,3; leading coefficient is (−1)^n and constant coefficient is one | Multiply by a sign unit to use monic division. Inverting q adds no new quotient elements. The displayed basis works for every M, including nonflat M. |
| Staticity of the inverse limit | Zero tower; 𝔽₂ coefficient stages; each transition N/Pₙ₊₁→N/Pₙ is onto | The countable tower is Mittag–Leffler, so its first derived inverse limit vanishes. No arbitrary inverse-limit/tensor interchange is asserted. |
| `ordinaryDerivedComparison` | M=0 and M=B=ℤ; M=ℤ/2 | The universal factorial-tower comparison recovers the ordinary completion with its projections. Integer torsion alone does not produce derived homotopy here. |
| `ordinaryDerivedComparison.pi_zero` | The same cases, homotopy degrees −1,0,1 | Zeroth homotopy is the ordinary limit; all other groups vanish by regularity and the surjective countable tower. The integral comparison is nonspherical. |
| `ordinaryDerivedComparison.finiteProjection` | n=1 gives M at q=1; n=2 gives three copies of M | Comparison is constructed from the specified quotient maps. It is not an arbitrary equivalence obtained by choosing a finite basis. |
| `ordinaryDerivedComparison.naturality` | Zero/identity maps, composable maps, ℤ→ℤ/2 as a ℤ-linear coefficient map | Every finite quotient map commutes, hence so does the limit comparison. Coefficient-map naturality makes no assertion about arbitrary tensoring through a limit. |
| Arbitrary-module boundary | Nonzero 𝔽₂ with q acting as 1 | Derived cofiber of q−1 is 𝔽₂⊕Σ𝔽₂, whereas the ordinary quotient is 𝔽₂. This checks failure of the finite regularity argument, without asserting that the final completion of this particular module is nonstatic. |
| Imported Gaussian/Pochhammer identity | a=0 or b=0; a=b=1; all commutative coefficient rings | Multiplying the factorial relation by (1−q)^{a+b} gives Pₐ₊ᵦ=PₐPᵦ times the Gaussian polynomial. No cancellation or division is needed. |
| `CountableSolidHabiroTensor.factorial_mul_dvd` | a=b=1 over ℤ: P₂=P₁²(1+q); a=b=0 gives 1∣1 | Correct divisibility direction and all natural indices are explicit. The two-factor equality is proved in Lean. |
| Excluded reverse divisibility | Evaluate at q=−1 over ℤ | P₂ is zero and P₁² is four; a divisibility witness in the reverse direction would imply 4=0. The negative control is proved in Lean. |
| Specialization at q=1 | Gaussian polynomial 1+q has value 2 over ℤ and 0 over 𝔽₂ | Polynomial identities survive specialization; a ratio of two specialized zero factorials is never used. Both values are proved in one Lean example. |
| Solid tensor application | Empty block families and zero object; singleton blocks; profiles n,m | Only the factorial supplier changed. The full solid product/tower/exactness and bounded-below resolution contracts remain hypotheses; classical polynomial arithmetic does not establish a spectral tensor theorem. |

No new data definition is kept in Lean. The two added theorems are
milestone signatures, and the five added examples are proved controls on
their regularity, direction and specialization conventions. Existing
Frobenius, discriminant, evaluator and completed-line declarations have
unchanged statements and bodies.

## Libraries and sources

Read the reviewed HabiroRings entries in `data/library-coverage.json`, the
current upstream roadmap material, and the current Tau Ceti library
without running Lake in either read-only checkout. Current upstream
roadmaps were inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`
and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
The nearby DGAInfinity and StablePeriodicCurved roadmaps supplied models
for separating enhanced targets from existing ordinary carriers.
Object/name searches found no existing Habiro comparison or q-factorial
toolkit there requiring a removal in this change. HC owns the proposed
toolkit; the receiver adds no second construction of it.

At pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, read
`Mathlib/Algebra/Polynomial/Laurent.lean` (`LaurentPolynomial`, `T`,
`T_apply`) and the native monoid-algebra coefficient implementation,
and `Mathlib/Algebra/Polynomial/Module/TensorProduct.lean`
(`polynomialTensorProductLEquivPolynomialModule`). The former supplies
the actual Laurent carrier in the new signature; the latter confirms
the existing polynomial coefficient-module vocabulary. No new module
carrier is defined. Pinned Tau Ceti is
`f790474821cf4256814db967cb154e7af3d0c369`; Suggested.lean needs only
Mathlib and does not import an unpinned Tau Ceti module.

Read the primary passages directly, using only public sources for this
job. Access date: 2026-10-20. The README's new ordinary/derived comparison
is derived from the stated regularity and limit argument, rather than
attributed verbatim to a source that only gives one of its inputs.

| Source/version and locator read | Use | SHA-256 of PDF |
| --- | --- | --- |
| [Wagner, arXiv:2510.04782v2](https://arxiv.org/pdf/2510.04782v2), Appendix B, Lemma B.2(c), p.77, and proof of B.8, pp.79–80 | Derived factorial tower and the factorial weights for the solid comparison | `591d0bdf2c48d12f91d6c9a4beec32978bc1e9a9448b04ef0efdc4a84315373b` |
| [Habiro, published 2004](https://ems.press/content/serial-article-files/40881), §7.1, Proposition 7.1 and Laurent comparison, pp.1141–1142; §7.3, p.1144 | Ordinary polynomial/Laurent and coefficient-module completions | `f56094672ada5ba71bbce69785be8c9d1377807c937b1011b1004f51dbf3071f` |
| [Bosco, arXiv:2306.06100v1](https://arxiv.org/pdf/2306.06100v1), Proposition A.3 and Lemma A.4, pp.92–93 | Confirms the abelian p-adic model and its scope; it does not discharge the spectral contract | `a142fc46709b8a54ef552a052f8a0c96006b578ef2565bbe4bcea6100505c7e9` |

The HC §1.1 toolkit and §2.3/§5.1 ordinary supplier statements were read
and checked against their use here. Also inspected Ong's Habiro notes,
pp.2–3, for the finite Pochhammer convention; they are not used as the
source of the derived theorem. No restricted book, source passage or
source file was copied into the repository. No suspicious instruction
was encountered in external data.

## Validation and completion

- `lean-check research/blueprint/packages/HabiroRings/Suggested.lean`:
  exit 0, zero errors, six warnings, all `declaration uses sorry`.
  Seven proved examples and the existing proved zero-evaluator theorem
  elaborate. The file is 182 lines, with no admitted data definition.
- All six HabiroRings packets pass `scripts/check_blueprint.py` with
  zero errors and zero warnings. The packets are unchanged; their
  existing gap/request statuses are not promoted by these checks.
- All 89 preexisting target anchors are retained, with one addition;
  local links resolve. No QSeries QM.0 supplier occurrence remains.
- `research/blueprint/intake.py check-files` on the four deliverables:
  zero problems. `git diff --check` passes.

No repair remains in these authorized receiver files. The donor edits
and other family ownership work above remain with their separate jobs.
The accepted fix verdict concerns this completed package repair and
preserves all preexisting enhanced, solid and arithmetic supplier
qualifications. It certifies neither admitted Lean proofs nor completion
of the entire family's dependency restructuring.
