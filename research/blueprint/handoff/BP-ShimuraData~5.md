# BP-ShimuraData~5 — stall-detector revision (round 5)

Issue #10134. Worker: Claude (Opus 5.5), session `claude-iigpvN`, 17 October 2026. Branch `claude-iigpvN-BP-ShimuraData-5`. The bot confirmed the claim. This is a complete planning pass, not a checkpoint, and it claims no implementation.

## Starting point

The stall detector queued this round at about 10:07Z, citing the packet's then-current reviewer REV-FIX-RT-AREA-algebraicgeometry~2. REV-ShimuraData~4 then accepted revision 4 at 10:59Z, with its own corrections made in place. REV-FIX-RT-AREA-algebraicgeometry~2's findings had already been answered by revision 4 (D0 prototypes, the failing elaboration, RT-AREA-algebraicgeometry/27).

So this round keeps every node, statement and correction of revision 4 and its review. It does what was still open:

- the review's remaining quality item;
- the source findings it left for confirmation;
- the GENERALITY rule, applied to the requests other roadmaps address to these stages;
- consumption of open upstream pull requests.

The accepted `review` object and `reviewHistory` are left unchanged for REV-ShimuraData~5.

## What changed

- **Acceptance lines (REV-ShimuraData~4, item 3).** Thirty lemma and theorem nodes repeated their statement as their only acceptance line, and two more carried a generic sentence about signatures. All 32 now have checks, each recomputed: small cases, degenerate cases and non-examples. Examples:
  - the conic of a quaternion algebra, which has no ℚ-point, for the reflex descent;
  - `#(P\G)(𝔽_q) = Σ q^{ℓ(w)}` for the Bruhat cells;
  - the four genus-two Kostant elements and what `w⁻¹` does to the Levi root;
  - `h(π,π;πi)` in the exponential kernel;
  - E17's unit `7+5√2` at the two places above 7;
  - the necessity of polarizability for reductivity of MT (a non-split extension of elliptic curves as complex tori).

  The four definitions among the 32 (Kostant representatives, Schubert families, adelic neatness, Kostant sequences) now list their API items and unit tests as acceptance lines, like the other definitions.
- **Requests from other roadmaps (GENERALITY).** Sixteen requests address ShimuraData stages, and none had a disposition. Each now has one in the new top-level `incomingRequests` and in the reader table *Requests from other roadmaps*. Answered here:
  - **New D4 nodes `D4/distinguished-datum` and `D4/distinguished-levi`** (requested by PerfectoidShimuraVarieties S6). The first is Lovering's `B(G^der, X⁺, E) = G ×_{G^ab} Res_{E/ℚ} G_m` (§4.6, Lemma 4.6.2 to Lemma 4.6.6), with its datum, reflex field `E`, independence of `G`, central-isogeny and norm functoriality, and Boxer–Pilloni's abelian-type diagram (Higher Coleman §4.4.41). The second proves `Z_s(G₁) = 1`, `Z_s(B₁) = 1 × Z_s(T)`, `B₁^c = G₁ ×_{G₁^ab} T^c` and the Levi identity `M^c_{μ_{B₁}} = M_{μ_{G₁}} ×_{G₁^{ab}} T^c`, which Boxer–Pilloni's Principle 4.4.44(1) uses without proof. Deligne 2.5.6 (p.282, page images) supplies the fibre-product step. New planet: "Distinguished Shimura datum" (D4 now has six).
  - **D4/preabelian-type**: API `preabelianTypeConnected` (preabelian type for connected data) and test `preabelianConnectedSl2`.
  - **D4/pel-type**: test `pelUnitarySignature`. PELModuli §M5.5's unitary data of signature `(r_τ, s_τ)` are of PEL type with dimension `Σ r_τ s_τ`, which is `[K⁺:ℚ]n²` for signature `(n,n)`. This answers AutomorphicGaloisRepresentationsPartII, which is itself upstream pull request #1006 (Layer AG2.4, HLTT model).
  - **D3/variation**: API `variationFilteredFlatBundle`, `variationGriffiths` and `variationHodgeBundles` (HodgeStructuresPartII H.0, H.2, H.3, H.8).
  - **D3/variation-morphism**: API `variationSub`, `variationHomKer` and `variationDirectSum`, with tests `variationKerZero` and `variationSubRationalLine`. The fibrewise algebra is Tau Ceti's at the pin: `IsSubstructure`, `IsSubstructure.hodgeStructure`, `isMorphism_subtype`, `IsMorphism.isSubstructure_ker` and `isSubstructure_range`, all new baseline citations.
  - **D3/rational-polarized-variation**: API `rationalVariationOrthogonal` with test `rationalOrthogonalSum`. Fibrewise this is Tau Ceti's `RationalHodgeSubstructure.orthogonal` and `isCompl_orthogonal` (H.8/orthogonal-constant-splitting).
  - **D3/kostant-representatives** and **D3/compact-dual**: tests `kostantTypeA` (shuffles; `C(n,p)` elements) and `dualUnitary` (Grassmannian), for HigherHidaAndColemanTheory.
  - **D5/gsp4-cayley-action** (AutomorphicFormsOnReductiveGroups AF.4): the statement now gives the Cayley conversion, checked on the page images of CG pp.9–10 and 28. The split character `(a,b;c)` corresponds to the compact `(−a,−b;a+b+2c)`, and CG's `Φ⁺` comes from the lower Borel. The requested `(a,b;a+b+2c)` is that map followed by the longest Weyl element, carrying `ρ_T = (2,1;−3/2)` to `ρ_H = (2,1;0)`. AF's request writes the conversion without the sign.

  The other requests are owned upstream: ShimuraVarieties §§P.1, P.3, P.4 and 6.3, and PELModuli §§M5.1–M5.2. The table names the stage each consumer should cite.
- **Upstream consumed.** ComplexKahlerGeometry §K4 (TauCetiRoadmap #953, head 8b03be51f4) plans holomorphic connections and the equivalence between flat holomorphic connections and finite-rank local systems (`L ⊗ O` with `1 ⊗ d`). It does so on ComplexManifolds Milestone 7 (#279, head 275ce8b253). This is the input the D3 gap "Holomorphic flat bundles and connections from local systems" asked for.

  Neither pull request is an atlas roadmap, so they are packet `sources`, cited in node text and in a new top-level `upstreamImports` list, not as prerequisites. The gap is narrowed to their registration as atlas stages. The heads of ShimuraVarieties #933, PELModuli #966, ReductiveGroupsPartII #785, AdelicAlgebraicGroups #792, ArithmeticLocallySymmetricSpaces #871 and AbelianSchemes #849 are unchanged since revision 4.
- **Sources and findings.**
  - E19–E22 are reproduced at their locators, E21 and E22 on page images. This is recorded as `recheckedBy`; the verdicts are REV-ShimuraData~5's to give.
  - D3/compact-dual carried the same Milne source entry twice. The second is now Milne SVI Theorem 2.14 with diagram (26), pp.29–30, the source REV-ShimuraData~4 meant to add for `compactDualBorelEmbedding`.
  - New source: Lovering, arXiv:1605.02717v3 (SHA-256 cdf3cc00…).
  - No new source findings.
- **Consumer retargets.** PerfectoidShimuraVarieties `S6/abelian-auxiliary-data`'s retarget for the superseded `D4/central-isogeny-lift` now also names `D4/distinguished-datum`. A new entry adds `D4/distinguished-levi` and `D4/distinguished-datum` to S6/torsor-fibre-product and S6/abelian-connected-towers-and-descent-group. Every citation of a superseded id in other packets has a retarget (checked by script).

## Counts and checks

- 56 nodes: 11 definitions, 9 constructions, 22 lemmas and 14 theorems. 85 API items, 71 unit tests, 20 planets, 29 baseline declarations (7 new, each read in its source at Tau Ceti f790474), 25 supplier requests, 16 answered incoming requests and 8 gaps. All six stages are `planned`.
- `python3 scripts/check_blueprint.py --index …/declarations.tsv research/blueprint/packets/ShimuraData.json`: 0 errors, 0 warnings.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- **The suggested file compiles.** `lean-check` at Mathlib 082e2d3 and Tau Ceti f790474 exits 0 with 114 `declaration uses 'sorry'` warnings and nothing else.
  - New declarations: `variationHomKer` (the fibrewise kernel is a sub-Hodge structure, on Tau Ceti's `IsSubstructure`), `cgToCompact` with `gsp4CayleyCompactCoordinates`, and the examples `dualUnitary`, `variationKerZero` and `kostantTypeA`. The new import is `TauCeti.Geometry.Hodge.Substructure`.
  - A `run_cmd` audit of a scratch copy, with every `example` renamed to a theorem, found one statement with `sorry` in its type: `compactCartanRank`'s membership proof, which predates this round. It now has a real proof (`omega`), and the audit reports none.
  - Every packet node, API and test name occurs in the file. Those whose carriers are not at the pins (the D4 datum predicates, the distinguished datum, holomorphic flat bundles) are in the README-only section.
- The reader is generated from the packet by a renderer that first reproduced all 54 HEAD node blocks and the request, gap, source-finding, source and dependency lines byte for byte. The one escape-rule change: `_` after `*` is now escaped, because `E*_ℝ` opened an emphasis span. A markdown-it pass shows no new emphasis or link spans except the intended ones, and no raw HTML except the two new anchors.
- A Sonnet subagent recomputed the arithmetic of every new acceptance line and test, about 70 items. It flagged three. Two were its own slips: it used another block form for `k`, and it miscounted `f₃·e₃`. The third, CG p.28's `λ`, was correct but easy to misread and is reworded.
- In-memory `merge_blueprints`: it succeeds, skipping the same seven cross edges ShimuraVarieties:V0/PELModuli → ShimuraData that REV-ShimuraData~4 reported and the restructure proposal reverses.

## What remains

- **D3.** Registration of ComplexKahlerGeometry/ComplexManifolds as atlas stages, so that §K4 can be cited as a prerequisite. Integral flag geometry over ℤ (ReductiveGroups layer 9 request). Parabolic-type representability for the reflex descent. The complex-manifold structure of `G_ℂ/P_h` (LieGroups layer 8).
- **D4.** The finite-index half of Ono's theorem (AA.3 extension request) and the Milne–Shih central extension (RG2.1 extension request, gap).
- **D1.** The finite-type representability input for the Mumford–Tate quotient.
- **D5.** The nonaffine `Res_{F/ℚ} ℙ¹` (gap).
- **For the maintainer.**
  - Seven packets still cite superseded ids until `consumerRetargets` is applied.
  - PerfectoidShimuraVarieties S6 should now cite the two new D4 nodes.
  - The restructure proposal stands; its D4 now also names Lovering's distinguished data.
  - AbelianVarietiesIsogenousToNoJacobian and ShimuraCompactifications cite the bare stages D4/D5 for material that is now ShimuraVarieties §P.1/§P.4's; the incoming-request table says which stage they should cite.

## Notions moved

None moved down or up in this round. Lovering's distinguished data were requested from D4 and are now owned there. No other roadmap or upstream pull request plans them; ShimuraVarieties §6.7 reduces abelian type through connected data instead.

## Sources read in this round

All with SHA-256 unchanged from the recorded copies, except Lovering, which is new:

- Milne SVI: Theorem 2.14 pp.29–30; Example 5.25 and Theorem 5.26 p.64.
- Milne SVH: Propositions 8.8–8.10, pp.512–513.
- Higher Coleman v1: §3.1 p.32 (page image); Remark 4.1.2 p.48; §4.4.41 to Principle 4.4.44, pp.78–82; Remark 4.6.6, pp.89–90.
- Calegari–Geraghty: PDF pp.9–10 and 28 (page images).
- Deligne 1979: 2.5.1–2.5.7, pp.281–282 (page images; the scan has no text layer).
- Lovering: arXiv v3, §4.6 and §4.7.2–4.7.3, pp.37–42.
- The upstream READMEs at their heads, read through the GitHub API: ShimuraVarieties #933 §§P.1–P.6 and 6.3–6.7; PELModuli #966 §§M0.12–M0.13 and M5.5–M5.6; AutomorphicGaloisRepresentationsPartII #1006 Layer AG2.4; ComplexKahlerGeometry #953 conventions and §K4; ComplexManifolds #279 Milestone 7. None was copied; only section numbers and names are cited.

No source was missing.
