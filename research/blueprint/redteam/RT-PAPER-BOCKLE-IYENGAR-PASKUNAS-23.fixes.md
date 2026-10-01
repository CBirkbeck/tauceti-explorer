# FIX-RT-PAPER-BOCKLE-IYENGAR-PASKUNAS-23

Issue #5523. Codex, session `codex-5ebb6f`, 1 October 2026. Input commit `e236453f6eb8bd7f94773ac63f42921b3b35fd40`. All five findings confirmed by the independent verifier are fixed in the extraction and its reader. This report records the changes; it does not supply an independent acceptance verdict.

The corrected extraction has **160 items: 12 planned, 148 missing, no library items**. Its seven routes persist: the local components/normality Part II has 102 missing items, the patched-density Part II has 20, and the five source routes retain their existing items. Every missing item is routed exactly once. Existing items keep their identifiers and statuses. The original nine source issues and their independent review objects are preserved; E10 and E11 await source-issue review.

## Finding 1: geometric-fibre closedness

Item 001 now places the closed invariant immersion in `X ×_S Spec κ`, with group `G_κ`. Item 003 keeps the original global Lemma 2.1 and explicitly applies it after base change to the components of the geometric fibre. Item 004 uses `G_κ·x`. Route 6 and the reader carry this correction.

E10 records the published p. 8 sentence and its counterexample. For a trivial action of `G_m` on `A¹_k`, the quotient is `A¹_k`. The fibre over `Spec overline{k(t)}` maps to the nonclosed generic point of the original affine line, so it cannot be closed there. It is closed after base change, cut out by `T − t`. Lemma 2.2’s tangent-space inequality survives.

## Finding 2: the finite residue extension in Lemma 3.35

Item 049 now assumes `κ(𝔭)/κ(𝔭∩R)` finite, with the paper’s finite residue field `k` explicit. Items 050 and 051 are unchanged. Route 1, route 6 and the reader specify the corrected import.

E11 records an error affecting the stated auxiliary Lemma 3.35. With `R = F_p⟦t⟧`, `A = R[x]`, `𝔭 = (0)` and `K = F_p((t))(x)`, the contraction lies in `P₁R`, but the residue extension is transcendental. Here `Â_𝔭 = K`. In the diagonal kernel of `K ⊗_{F_p} A → K`, differentiation in the second-factor `t` and `x` gives two independent cotangent functionals, detecting `1⊗t − t⊗1` and `1⊗x − x⊗1`. Both extend to the completion through the quotient by the square of the diagonal ideal. Its cotangent dimension is therefore at least two, whereas `K⟦T⟧` has cotangent dimension one.

The published proof uses the false inference from finite type to finite residue extension. Corollary 3.38 (p. 25) and Proposition 4.9 (pp. 36–37) instead use closed points over the punctured spectrum, where Lemma 3.18(3), p. 16, supplies finiteness. Thus the main theorems remain intact. The characteristic-p local-field diagonal argument in Böckle–Juschka Corollary 3.3.4/Lemma 3.3.5 is recorded as the supplier, with the local-field hypothesis retained.

## Finding 3: Hochschild input to Proposition 3.11

Items 149–151 separate the promised ordinary Hochschild carrier, the Hom-bimodule coefficient cochains/derivations and the cited comparison. The field, associative finite-dimensional algebra, finite-dimensional left modules and bimodule action are explicit. Degrees zero and one identify with `Hom_A(U,V)` and `Ext¹_A(U,V)`. The resulting dimension formula for `Z¹` is the input to equation (11), followed by Lemma 3.6 and local duality.

Item 149 imports the ordinary associative specialization of **DGAInfinity Layer 8** and is planned, not implemented. Its text does not pretend that the layer explicitly promises arbitrary coefficient comparisons. Items 150–151 are missing named imports in route 6. The general coefficient extension belongs with the DGAInfinity owner, through a Part II if needed; the local consumer must not construct another carrier. This owner assignment is also a handoff to the design job: the permitted deliverables do not include a DGAInfinity packet or new roadmap. Supplier proof closure and any extension design follow the extraction under PROTOCOL §16.

Cartan–Eilenberg, *Homological Algebra*, Proposition IX.4.4.1 and Corollary IX.4.4.4, is added to prerequisites. Its locator and comparison were checked in the published BIP proof, p. 14; the book proof itself has not been read or closed.

## Finding 4: local framed derived homotopy-discreteness

Items 152–154 record the local framed derived object, the exact imported criterion and the local consequence separately. Item 059 and the reader now name the consequence. Route 6 takes the three missing items once and names Galatius–Venkatesh and Cai in its brief and prerequisites.

The functor is the local **framed** simplicial `GL_d` deformation functor over `O`, using Cai’s homotopy-invariant classifying-space model. Its degree-zero functor is the ordinary framed one even for reducible residual representations. No extra scalar-endomorphism hypothesis is imposed. The generic criterion retains finite tangent dimensions, amplitude in degrees 0 and 1, the minimal complete-intersection presentation and its regular sequence. The `O`/`W(k)` coefficient and framed-model comparisons are explicit named supplier obligations. These objects are not the planned perfect complexes or patching modules in R03/P7/P8.

Homotopy-discreteness uses the pro/represented-functor convention of Galatius–Venkatesh Definition 7.4. Thus positive homotopy **pro-groups** vanish and the associated complete degree-zero ring is `R^□_ρ̄`; this does not assert termwise vanishing at every simplicial Artinian approximation. The fix imports the criterion and models rather than claiming supplier proof closure.

## Finding 5: separate density variants of Remark 6.2

Items 155–160 and route 7 now record the following, separately from Theorem 6.1 in item 147:

- **Benign points and their density.** Emerton–Paškūnas Definition 6.8 requires pairwise distinct linearized `φ^f` eigenvalues, every refinement non-critical, and ratios different from `p^{±f}`. The crystalline weights are regular and vary; one fixed-weight crystalline locus is not asserted dense in the unrestricted ring.
- **Prescribed inertial type.** The potentially crystalline point family has `N = 0`, compatible type and varying regular weights. The source’s shorthand is recorded as a construction, with its nonempty supported target and component coverage explicitly required. It is not an unrestricted density theorem for every type on every component. The design job must make the capture/support hypotheses precise before stating such a theorem. In particular, the fixed auxiliary-place type in Emerton–Paškūnas §5.3 must not be confused with a proof for arbitrary fixed local type.
- **Ramified supercuspidal family.** The definition uses the minimal simple-stratum capture family in Emerton–Paškūnas §3.4/§5.3, including the minimal-element condition. Totally ramified extensions of degree `d` are allowed; any more general extension must contain a minimal element. The regular weight stays fixed and simple types/conductors vary. The simple-stratum definition avoids an unsupported identification of general wild supercuspidals with arbitrary induced characters.

Every density strengthening retains `p ∤ 2d`. The brief tracks the annihilator-supported target of Emerton–Paškūnas Theorem 5.3 and the Emerton–Gee lift and BIP faithfulness comparisons needed to transport it to `X^□`. Definition 6.8, Proposition 6.9, §§3.4/5.3/5.4 and Theorem 5.3 are added to the prerequisite locators. Refinement/non-criticality, types, Weil–Deligne representations and local Langlands are named imports from their suppliers.

## Evidence and validation

The source reading date is **2026-10-01**. `sourceVersions` records the published BIP artifact, and `source.fixReading` records URLs, hashes, selected passages, atlas commit and library scope. The original full-reading provenance remains unchanged. Publisher pages 8 and 24 were inspected as images as well as text. Cambridge stamps each download, so the new hash differs from the original extraction’s hash.

The full one-page corrigendum corrects only an affiliation. The arXiv version listing, Iyengar’s public papers page and targeted publisher/arXiv searches yielded no prior correction to the two new source issues. Novelty is scoped to that bounded search; E10/E11 are against the published version only, and no independent review object is fabricated.

Supplier readings were selected passages of Galatius–Venkatesh v3, pp. 79–80; Cai v1, §3.1.2 and the local extension paragraph in §3.1.3; Emerton–Paškūnas selected §3.4, §§5.3–5.4, Definition 6.8 and Proposition 6.9; and Böckle–Juschka pp. 17–18. The extraction records the scope precisely and does not claim full new readings of those papers.

Pinned Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`. The relevant actual layer texts and reviewed coverage were checked. Bounded searches of both pinned trees found no matching added item; no new positive implementation claim is made.

Validation: `scripts/check_paper.py`, `scripts/check_errata.py` on a scratch errata-format projection of the source issues and versions, intake `check-files` for the three deliverables, and staged `git diff --check`. A routing/integrity check confirms all 148 missing items are routed exactly once, all original identifiers/statuses persist and E1–E9 are unchanged. No Lean file is a deliverable; Lean was not run.
