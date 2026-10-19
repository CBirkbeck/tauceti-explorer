# Independent review: Motivic and étale methods, M.6a

**Verdict: accepted.** Reviewed by Codex, session `codex-QtLh43`, on
19 October 2026, for issue #10795. The input was written by a different session,
`codex-IvZaYn` (BP-MotivicEtaleKTheory--M.6a, PR #10967).

The current queue and deliverables assign M.6a alone. The older embedded brief
also names M.6b, M.7 and M.8; those have separate jobs. This review accepts the
integral support tower, its cycle layers and its global-model comparisons.
It makes no convergence, étale comparison, Adams-operation or regulator claim.

| Item | Reviewed result |
| --- | --- |
| Nodes | 21: 2 definitions, 5 constructions, 11 theorems, 3 comparisons |
| Per-node verdicts | 19 verified, 2 corrected; none unverifiable |
| Nodes added or removed | 0 |
| API requirements | 59 across all 7 definitions/constructions |
| Named Checks | 26; at least 3 for each definition/construction |
| Planets | 5, attached to central definitions/constructions/theorems |
| Baseline declarations | 4 confirmed; none removed or replaced |
| Foreign supplier nodes | 45 distinct exact nodes read, plus 3 stage-level extension contracts |
| Internal gaps / requests | 0 / 3 |
| Source issues | 2 confirmed; none rejected or newly added |
| Packet / coverage | complete planning pass / M.6a planned, not closed |

All implementation statuses remain `unchecked`. The explicit supplier requests
are prerequisites for implementation and closure. Acceptance means that the
target-level plan and its stated contracts are sound.

## Mathematical and source checks

Every node's statement, hypotheses, proof sketch, acceptance criteria, source
locator and direct prerequisites were read. The packet's `review.checked`
records all 21 individual verdicts and the particular argument checked. The
following are the main proof boundaries verified against the sources:

| Nodes | Source and check |
| --- | --- |
| facewise-supports; support-tower | Levine, *The homotopy coniveau tower* (HCT), §§2.1–2.2, pp.9–12; *Chow's moving lemma and the homotopy coniveau tower* (Moving), Definitions 2.3.1 and 2.6.1, pp.9–13. Every nonempty face, including the whole simplex, participates. The affine predicate measures heights in each face ring. The tower is built from supported K-spectra, filtered homotopy colimits and realisation. |
| k-support-axioms; moving-with-constraints | HCT axioms A1–A3, pp.10–11, and Theorem 6.4.1, p.35; Moving Theorem 2.6.2, pp.13–14, Proposition 3.3.4, pp.23–24, and §§5–6, pp.27–40. Finite-field descent inverts the extension degree before homotopy fixed points; coprime extensions recover the integral result. Moving gives a realised equivalence and does not assert degreewise cofinality. |
| localisation-excision; functorial-tower; tower-homotopy-invariance | HCT Theorem 3.2.1 and Corollary 3.2.2, pp.14–18, Theorem 4.1.1, pp.20–22; Moving Theorem 3.3.5 and Lemma 3.3.6, pp.24–25, §§7.3–7.5, pp.47–58. Supports must first extend across the open immersion. Rectification applies to the whole tower and its transition maps. |
| semilocal-simplex; well-connected-theory; semilocal-criterion; k-well-connected | HCT §5.1, pp.26–27, Definition 6.1.1 and Lemma 6.1.3, pp.30–31, Lemmas 6.3.1–6.3.2 and Proposition 6.3.4, pp.32–35, Theorem 6.4.1, pp.35–36. The vertices are localised simultaneously. The total face cube and the ordinary singular boundary pair are identified only through the requested KH input. Lifting GL and injectivity of vertex rank suffice for relative K₀ vanishing. |
| purity-t-loop-shift; layer-idempotence; point-layer-model | HCT Theorem 3.3.4, pp.19–20, Lemma 4.2.1 and Proposition 4.2.2, pp.24–25, Lemma 5.2.1 and Propositions 5.2.2–5.2.3, pp.27–29, Theorem 5.3.1 and Corollary 5.3.2, pp.29–30. Purity assumes a specified normal trivialisation. Local frames suffice for vanishing. The point model reapplies the layer to the layer spectrum, before replacing field coefficients by Hℤ. |
| pointwise-cycle-map; face-rank-compatibility; layer-cycle-equivalence | HCT equation (6.4.1) and Theorem 6.4.2, pp.36–37. The map is canonical zero-Postnikov truncation followed by rank. Actual supported restrictions induce the simplex maps. Alternating Tor lengths retain the multiplicity 2 in the test s=x². The homological convention is πₘLᵖK=CHᵖ(X,m)=H²ᵖ⁻ᵐ(X,ℤ(p)), without an extra suspension. |
| face-exact-coherent-model; levine-global-comparison | Levine, *K-theory and motivic cohomology of schemes, I* (Global), §2.2 and Remark 2.3, pp.8–9, Lemma 3.3 and Remark 3.4, p.13, Appendix A.2–A.3, p.81, and B.2–B.9, pp.81–84. Face Tor-independence makes restriction exact. Smooth quasi-projectivity supplies the finite locally free resolutions, also on open complements. The comparison concerns supported spectra and the entire tower. |
| friedlander-suslin-support-tower; friedlander-suslin-global-layer | Friedlander–Suslin (FS), (5.0.1)–(5.0.2), p.794, (6.0), p.798, the relative-cycle identification, p.816, Proposition 12.1 and Corollary 12.2, pp.829–830, Proposition 13.10, pp.837–838, Appendix C.4–C.7, pp.866–867. Big bundles give strict pullbacks. Finite Waldhausen diagrams lie in one finite-union support. The full Ω-prespectrum fixes the shift. MC.4 supplies quasi-finite dominant relative cycles. |

The four public texts were independently opened and their SHA-256 hashes
matched the packet's `sourceVersions`. HCT and Moving use their specified 2005
arXiv v1 manuscript pagination; Global uses the named author manuscript; FS
uses published pagination 773–875. The packet and reader provide the exact
URLs and version register. The checks concern the cited arguments, not an
independent reconstruction of every theorem cited by those arguments.

The API outlines support construction, characterisation, restriction,
functoriality and comparison without unfolding the objects. The Checks detect
omitted faces, ambient-height mistakes, false degreewise moving, wrong
semilocalisation, incorrect T-loop conventions, lost multiplicities and shifts,
and confusion between the total face cube and a singular boundary. All five
planet names describe the mathematics rather than a source locator.

## Corrections made

1. **Local frames and vanishing.** Clarified `layer-idempotence`: on a smooth
   stratum with trivial normal bundle, any chosen local frame proves the
   relevant object zero. Independence of that choice is unnecessary for this
   use of purity. This makes explicit why the source's problematic general
   canonical-frame argument is not needed here.
2. **Canonical cycle map.** Clarified `pointwise-cycle-map` to use
   B→H(π₀B) followed by the rank identification π₀B≅zᵖ(X,n). Its wedge formula
   characterises that map and requires no chosen inverse to a wedge
   decomposition. Added the direct prerequisite
   `StableHomotopyKTheory:H.5:spectra/postnikov-sections`, whose statement
   supplies the truncation and its heart identification.
3. **Compact Lean file.** Applied UPSTREAM_GUIDE's broad `import Mathlib`
   rule. Replaced the admitted examples with four proved examples, two for
   each real definition. The two geometric checks that still require proof
   are named theorem targets, `support_vertex_fails` and
   `support_interior_point`. There are six named admitted theorem targets,
   no admitted examples and no admitted data. The file remains a compact
   specification over existing ideal, quotient and height carriers.
4. **Source-review records.** Added independent verdicts to both source
   issues, recorded the arXiv/author-page searches and the publisher's HTTP
   403 response, and limited the findings to the preprint actually read.
5. **Assembly and routing.** Recorded the six legacy M.6a IDs in the M.5d
   packet and the incoming rational cubical cycle-class request. Those need
   assembly adapters; neither is a new theorem of the integral layer
   calculation. Added the three assigned red-team routing records.
6. **Reader.** Synchronized both proof clarifications, the added prerequisite,
   source-review scope, assembly obligations and the actual Lean examples.

No baseline citation was removed or repaired, no mathematical target was added
or removed, and no foreign deliverable was edited.

## Baseline, ownership and closure

The four baseline declarations were read in the Lean sources at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Declaration | Module and supported use |
| --- | --- |
| `Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean`: prime-chain height, with ideal height defined by minimal primes; applies in each commutative face quotient. |
| `Ideal.span` | `Mathlib/RingTheory/Ideal/Span.lean`: ideal generated by a set; generates the omitted-coordinate face ideal. |
| `Ideal.Quotient.mk` | `Mathlib/RingTheory/Ideal/Quotient/Defs.lean`: quotient ring homomorphism; restricts the support ideal to a face. |
| `Ideal.map` | `Mathlib/RingTheory/Ideal/Maps.lean`: ideal generated by the image under a ring homomorphism; supplies that restriction. |

Their hypotheses are sufficient for the packet's commutative-ring uses and
their conventions agree with the two light Lean definitions. Tau Ceti remains
pinned to `f790474821cf4256814db967cb154e7af3d0c369`; this file uses no Tau Ceti
declaration.

Read AUDIT-30 and its review, the relevant library-coverage entries, RS-08 and
its accepted review, and the current upstream AlgebraicVectorBundles and
AlgebraicTopology README/Suggested material. The read-only roadmap checkout was
at `0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Existing vector-bundle/K₀
work is reused. S.4 owns ordinary codimension coniveau, while M.6a adds the
simplex support diagram and realisation. Spectra, higher K-models, cycles,
normal deformations, operations and convergence retain their existing owners.

All exact foreign prerequisite statements were read. The three requested
extensions correctly identify what their current suppliers do not yet give:

- **H.5:spectra:** arbitrary small filtered support homotopy colimits and
  simplicial realisation, stable exactness, Fubini, coherent tower/presheaf
  replacements, Eilenberg–MacLane realisation, finite averaging and total
  face-cube/Ω-prespectrum compatibility. A sequential telescope alone is
  insufficient.
- **S.5:** normal-crossing KH closed descent, the low-degree K→KH comparison
  and the relative exact sequence for the semilocal simplex boundary.
  Ordinary K closed descent on a singular union is not assumed.
- **SF.5:** the proper-intersection Tor-length formula and Serre vanishing
  over an essentially smooth regular perfect-field ambient scheme, including
  compatibility with successive faces and flat degeneracies. The supplier's
  present algebraically closed-base statement needs this extension.

These remain explicit requests, so the stage stays planned. Degreewise
vanishing for p>dim X+n does not imply an eventual bound on the realised
tower. M.6b must establish its own exact couple and convergence.

## Source issues and attached findings

Both findings are confirmed against [HCT arXiv v1](https://arxiv.org/pdf/math/0510334v1):

- **E-HCT-boundary-rank**, Theorem 6.4.1 proof, p.36. For n=1 the boundary
  ring is F×F and its K₀ is ℤ². The proof needs injectivity from K₀(R), which
  follows from rank at any vertex, together with K₁ surjectivity. The packet
  already uses this corrected proof.
- **E-HCT-normal-frame**, Corollary 4.2.4 proof, p.26. A single diagonal
  nonzero vector cannot trivialise a rank-d bundle when d>1. This is a gap
  in the general canonical-purity argument. Local trivialised purity suffices
  for vanishing, and the K-specific coefficient uses dévissage and rank.
  No false conclusion of the corollary is asserted.

The [arXiv record](https://arxiv.org/abs/math/0510334) lists only v1; the
[author's publication list](https://www.esaga.uni-due.de/marc.levine/pub/)
gave no linked correction for this paper. The
[publisher PDF](https://londmathsoc.onlinelibrary.wiley.com/doi/pdf/10.1112/jtopol/jtm004)
returned HTTP 403. The published text was not collated, and novelty of either
observation is not established.

The assigned verified red-team findings were read and routed explicitly in
both packet and reader. RT-AREA-ktheory-1/2 requires Beilinson–Lichtenbaum and
the number-ring reduction in M.5d/M.7, to be imported by M.6b's finite-coefficient
comparison. RT-AREA-ktheory-1/3 requires the real KO/BO, Bott and Suslin inputs
for M.7/N.5. RT-AREA-ktheory-2/18 places the common Soulé finite Chern classes
and product formula once in the M.7-dependent portion of M.8, exported to
HB.1/HB.2/D.2. None supplies an extra prerequisite for this integral tower.

## Orchestrator actions and validation

No blocking question remains for this review. At assembly, preserve references
to the six legacy M.6a IDs through the replacements listed in the handoff.
Replace the old M.5d `k-theory-well-connected` boundary-rank proof by this
packet's corrected argument. Route the M.6 `chern-character-edge-comparison`
request for equality with Levine's rational cubical cycle class to its
map-level adapter. These edits belong to their owners, outside this review's
files. Discharge the three supplier contracts before claiming closure.

- `python3 scripts/check_blueprint.py research/blueprint/packets/MotivicEtaleKTheory--M.6a.json`:
  **0 errors, 0 warnings**.
- `lean-check research/blueprint/suggested/MotivicEtaleKTheory--M.6a.lean`:
  exit **0**, exactly **6 warnings**, all declaration uses `sorry`. The four
  examples are proved. Available memory was checked before compilation, and
  checks ran sequentially through the shared pinned wrapper.
- Packet/reader comparison checks all node statements, hypotheses, proof
  steps, acceptance criteria, prerequisites, API items and named tests. Source
  hashes match. The suggested file has 113 lines, two real definitions,
  six named theorem targets and four proved examples.
- Intake file checks: **5 files, 0 problems**. `check_sorry_data.py` and
  `git diff --check` pass.

No result is claimed formalised by this review. The committed deliverables and
handoff contain everything needed for assembly and the supplier follow-ups.
