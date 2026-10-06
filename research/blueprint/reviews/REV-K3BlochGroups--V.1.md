# Independent review: K₃ homological model, V.1

**Verdict: accepted after corrections.** Reviewer: Codex, session `codex-SM6L4J`; job `REV-K3BlochGroups--V.1`; review date 2026-10-05; issue #6396. This session did not author the plan. Acceptance concerns a complete target-level planning pass, not formalisation or closure of the stage.

The packet has 10 nodes: five theorems, two comparisons, two constructions and one application. Five nodes are verified and five corrected; none is added or unverifiable. All 21 baseline citations are confirmed; none is removed or replaced. The two constructions retain 13 API items and eight tests (three and five respectively). There are ten supplier requests, three explicit gaps, one independently confirmed source issue, one planned stage and no closed stage. This follow-up now adds one planet; together with the accepted parent there are five planets in V.1.

## Sources and corrections

I independently downloaded and read the two public author copies. Their SHA-256 values match the packet:

| Source | Passages checked | SHA-256 |
| --- | --- | --- |
| [Weibel, standalone Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf) | Definition 1.1, Functoriality 1.1.2; Lemma 1.19, Remark 1.19.1, Corollary 1.20; Exercises 1.8–1.12 and 1.25; Example 4.9.2, Theorem 4.9.3, Example 4.10.1 | `9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248` |
| [Hatcher, Algebraic Topology](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf) | §4.2, Examples 4.49–4.52, printed pp.380–381; Exercise 37, p.392 | `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` |

Every node's locator and excerpt was checked. Exercise 1.9 contains neither the quoted word “Hurewicz” nor the claimed hint. I replaced the excerpt with its actual perfect-group phrase and explained that the intermediate Hurewicz argument comes from the upstream supplier. The other excerpts match their locators. The finite-stage result is explicitly a deduction using the imported colimit and finite supports, rather than a quoted finite-rank theorem.

I confirmed `K3BlochGroups/E31` at Exercise IV.1.25, IV.17 (PDF page 17), and added the required reviewer verdict. For the identity fibration `* → S³ → S³`, all stated spaces are simply connected. The first π₃ map is the identity of ℤ and the next Hurewicz map is an isomorphism. Their composite is nonzero, contradicting exactness. The sufficient corrected map formulation includes `H₃(Y;ℤ)=0` and surjectivity on π₂. Its mapping-cylinder pair is two-connected; relative Hurewicz, the pair homotopy LES and homology LES then give the corrected exact sequence. The wedge of two-spheres used in this plan meets the added condition.

Confirmation is confined to the identified author copy. The author errata link remains inaccessible (404 on the current sites host); a search found no correction. I do not infer anything about the unavailable AMS published text, and retain the packet's version boundary and prior search history. No additional source issue was identified.

## Mathematical and ownership checks

| Node suffix | Verdict | Independent check |
| --- | --- | --- |
| `two-connected-hurewicz-input` | corrected | Superperfection, plus homology preservation, then Hurewicz in degrees two and three; source citation corrected. |
| `cover-and-fibre-interface` | verified | Actual covering distinguished from a homotopy-equivalent plus model; BK₂ fibre and higher-π comparison range correct. |
| `canonical-comparison-interface` | corrected | Four canonical maps composed in the right directions, with inverse and additive API; duplicate planet removed. |
| `cycle-certificate-evaluator` | corrected | Existing unnormalised integral cycles, quotient projection and finite boundary witnesses; duplicate planet removed. |
| `ring-map-comparison-square` | verified | Naturality uses canonical maps and a genuine topological square; tuplewise chain maps transport certificates. |
| `finite-stage-cycle-certificates` | verified | Finite support and eventual equality require a common later rank, without injective transitions or a uniform stability bound. |
| `elementary-cover-hspace` | verified | Existing based lift and homotopy-lift interfaces supply the ring application through the upstream generic owner. |
| `hspace-hopf-kernel-refinement` | verified | Corrected relative argument, unordered Whitehead pairs, H-space vanishing and Hopf additivity; G1 remains explicit. |
| `hopf-minus-one-product-refinement` | corrected | External product and sphere-action conventions retained; characteristic-two justification clarified. |
| `elementary-homology-exact-sequence-refinement` | corrected | Canonical Hurewicz square and exactness transport checked; characteristic-two justification clarified and duplicate planet removed. |

For arbitrary associative unital A of characteristic two, the external scalar pairing factors through the central prime field: `ℤ → 𝔽₂ → A`. Its coefficient change identifies the pairing with `K₂(A) × K₁(𝔽₂) → K₃(A ⊗ 𝔽₂) ≅ K₃(A)`. The scalar class becomes `[1]=0`, so bilinearity makes the operation vanish. I inserted this argument in the two affected nodes and the K.7 request. An internal K-product on a noncommutative A is unnecessary.

I read the parent targets and the finer H.1, H.2, H.3, K.2:plus, K.7 and T.1 supplier statements. Their roles agree with the requests. All seven inherited targets remain represented. No generic bar, classifying-space, plus, covering, HSpace, product or Steinberg/UCE construction is replanned here. The reviewed `AUDIT-29` V.1 entry and confirmed `RT-AREA-ktheory-1/29` are respected in both packet and reader: T.1:classical owns stable Steinberg/UCE/superperfection, and the explicit supplier edge leads into V.1. A reachability check against the current stage graph confirms that this edge creates no cycle.

The three gaps are substantive and honestly retained: G1 for shared Hopf/Whitehead operations, G2 for compatible multiplicative BPQ/sphere-unit/precomposition action, and G3 for transitive supplier proofs and compatibility. General spectrum carriers or bare BPQ do not discharge G2. I corrected the restructuring provenance: RS-33 was accepted on 2026-09-29; it preserves the finer H IDs and does not itself supply the missing packages. The stage remains planned, with precise remaining work, and is not claimed closed.

## Baseline, API and suggested Lean

At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, I read every cited declaration's actual statement:

- `GroupHomology/Basic.lean`: the eleven complex, differential, cycle, homology and subsingleton entries, including the inverse action in the leading differential term.
- `GroupHomology/Functoriality.lean`: all seven chain, cycle and homology-map entries, including identity/composition and projection compatibility.
- `Topology/Homotopy/HSpaces.lean`: the existing continuous multiplication, chosen unit and relative unit homotopies.
- `Topology/Homotopy/Lifting.lean`: based unique lifting and relative homotopy lifting, with their connectedness/local path-connectedness assumptions.

The Tau Ceti pin `f790474821cf4256814db967cb154e7af3d0c369` was searched at its exact git object. No Tau Ceti declaration is cited or imported by this suggested file. Searches at the pinned sources and in the supplier plans support retaining G1/G2 rather than asserting that the missing packages already exist.

The comparison's three tests pin the canonical composition, the trivial-group case and zero detection. The evaluator's five tests pin the nonzero identity triple and its four-chain boundary, zero, projection compatibility, noninjectivity even for the trivial group, and rejection of a noncycle. In particular, the identity triple distinguishes the unnormalised complex from an unnoticed normalised replacement. All 13 API names and all eight test names match the suggested file.

The Lean file is unchanged. `lean-check research/blueprint/suggested/K3BlochGroups--V.1.lean` exited 0 with 25 warnings, all for declarations using `sorry`, and no errors. Its Mathlib imports use the exact pinned Mathlib build. This does not verify a Tau Ceti build at the stated pin. The signatures honestly take canonical supplier maps as data; the exactness transport assumes the source H-space exact sequence, not the desired target exactness. Unavailable topological and eventual-transition interfaces are explicitly omitted under §13. No implementation is claimed.

## Planets, checks and orchestrator notes

The accepted parent already supplies four V.1 planets. The three new markers for the homological comparison, bar evaluator and elementary quotient duplicate those presentations; the merger unions their distinct IDs and would show eight. I removed those three markers and retained **Suslin’s Hurewicz lemma**, giving five total. Every declaration remains in the plan. This fixes a combined-packet limit that the per-packet checker alone does not catch.

Validation: blueprint checker **0 errors, 0 warnings**; intake file checks **0 problems**; `git diff --check` clean; combined planet count **5 ≤ 6**; API/test synchronization and the targeted ownership-edge cycle check pass; Lean elaboration passes as described above.

For the orchestrator: the companion reader is outside this issue's listed deliverables. Its final planet paragraph describes the author's former four-marker selection; it should describe the retained parent planets plus this single new marker. Its RS-33 paragraph should also be updated to the accepted status. These editorial updates do not change its mathematics or the checked red-team ownership boundary. The present packet and this independent report record the corrected selection and provenance. G1/G2 extension design and G3/request discharge remain follow-up work under their stated owners.
