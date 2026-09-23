# Independent review: profinite and pro-p group links

**Accepted after corrections and two additions.** Codex — `codex-7e92bd`, 23 September 2026. Refs #93. Reviewer: `independent-review-REV-LINK-tauceti_TauCetiRoadmap_ProfiniteProPGroups`.

The [revised packet](../links/tauceti_TauCetiRoadmap_ProfiniteProPGroups.json) has **34 links: 20 incoming and 14 outgoing**, seven overlaps and 217 examined partners. All 32 original links are retained. Acceptance concerns the dependency contracts and the delimited overlap recommendations; it does not certify the roadmap proofs, library availability, or authorize changes to upstream roadmaps.

## Independence and source coverage

The original packet was committed in `3bbae93d74134ee48575d60d889fc8e57f3ac7e9`, credited to Claude Opus 5. I did not author it. Claim comment 5797246329 was explicitly confirmed by the bot before review work began.

I read all **38 distinct stage descriptions** appearing as original link endpoints or overlap members, in full: PPG Layers 0–7, the Layer 9 prerequisites and Layer 10; ProfiniteCohomology Layers 0–3, 5, 7, 8 and 10–13; BelyiMaps Layers 12–13; GrothendieckEulerForms Layer 5; and the named stages of ClassicalAdicEtaleCohomology, ColemanPowerSeries, DiamondEtaleCohomology, DiamondSixOperations, IntegralIwasawaTheory, InverseGaloisAndArithmeticFundamentalGroups, NoncommutativeAndEquivariantIwasawa, PadicMeasuresIwasawaAlgebras, ReductiveGroupsPartII and SmoothRepresentationsOfLocalGroups.

Document-level evidence outside a stage was separately read in context: PPG's ownership boundary, IntegralIwasawaTheory's I-stage dependency header, ColemanPowerSeries' scope paragraph, PMIA's canonical-interface paragraph, ProfiniteCohomology's universe convention and QuadraticFormInvariants' coefficient supplier table. The atlas, original packet and focal README matched `main` when the review snapshot was acquired. The catalogue contains 218 roadmaps; all 217 partners have an original examined entry. I preserve that author's catalogue-wide screen and distinguish my seven-stage completeness check below.

## Every original dependency

Numbers are the original packet order, unchanged in the revised file. `PC` means ProfiniteCohomology; `PPG` means ProfiniteProPGroups.

| Links | Supplier → consumer | Independent check |
|---|---|---|
| 1 | PC 0 → PPG 6 | Finite discrete actions factor through finite quotients; the pro-p trivial-filtration argument uses precisely this input. |
| 2–3 | PC 1 → PPG 5, 7 | The named carrier/dictionary and coefficient maps supply the trivial coefficient construction and prescription reductions. |
| 4–5 | PC 2–3 → PPG 5 | Explicit normalized cocycles and the canonical comparison support extensions and the H¹ rank interpretation. The coefficient-category comparison issue is retained in overlap 3. |
| 6 | PC 5 → PPG 5 | The five-term sequence supplies the transgression used for relation rank. |
| 7 | PC 5 → PPG 6 | Retain the low-degree exactness input; narrow the reason so it does not claim arbitrary-degree dévissage from this supplier. Link 12 supplies that part. |
| 8 | PC 5 → PPG 7 | Retain the named five-term maps and prescription connecting maps. Correct the explanation: the three-term Euler formula additionally needs PC 10. The consumer's PC-6 label does not move the five-term declarations out of PC 5. |
| 9–10 | PC 7 → PPG 6, 7 | Closed-subgroup coinduction and low-degree Shapiro match the coefficient modules and Euler calculations. All-degree `shapiroIso` remains PC 10's export. |
| 11 | PC 8 → PPG 7 | Evaluation cups and the C₂ square are exact matches. Swapping the order of the evaluation factors uses graded commutativity. Perfection, trace normalization and the extension-class identification remain consumer arguments. |
| 12 | PC 10 → PPG 6 | All-degree transfer, Shapiro, dimension shifting and exactness are needed by the Sylow and higher-vanishing arguments. |
| 13–15 | PC 11 → PPG 6, 7, 10 | The same `cd_p` carrier, coefficient reductions and closed-subgroup inequality are used. An open prime-to-p-index theorem is not substituted for the closed-subgroup theorem. |
| 16–17 | PC 12 → PPG 5, 7 | The canonical pairing/cup and projection formula match the stated operations. The projection formula does not itself establish compatibility of chosen duality traces. |
| 18 | GrothendieckEulerForms 5 → PPG 6 | Finite exact-sequence Euler additivity specializes to the finite-dimensional finrank calculation. Removed the unnecessary claim about a particular landed library declaration; this review establishes the roadmap contract. |
| 19–21 | PPG 0, 3, 4 → BelyiMaps 12 | Completion, the maximal pro-p quotient and the rank-one/free-group identifications supply the specified constructions. Generic powers are assigned to ProfiniteArithmetic in the retained target text. |
| 22–23 | PPG 3, 4 → BelyiMaps 13 | The characteristic pro-p kernel permits outer-action descent; the peripheral carrier is the supplier's free pro-p group. |
| 24 | PPG 9 prerequisites → IntegralIwasawaTheory I.1 | The completed group algebra and algebraic generator substitution are explicitly imported. This does not validate the upstream text's separate filtration claim; see overlap 6. |
| 25 | PPG 4 → ColemanPowerSeries L0 | The abelian pro-p module construction applies to the inverse limit of principal units. It is not applied to all local units with prime-to-p torsion. |
| 26 | PPG 0 → PMIA L1 | Quotient and inverse-limit foundations supply the completed group-ring indexing and separation arguments. |
| 27–28 | PPG 2, 3 → DiamondEtaleCohomology C8 | Both imports are explicit: Sylow theory and the pro-p structure API. The link does not supply the valuation-theoretic wild-inertia proof or Hochschild–Serre. |
| 29 | PPG 2 → ClassicalAdicEtaleCohomology H1:valuation-nearby-cycles | The stated pro-p Sylow/tame comparison uses the abstract Sylow package. The arithmetic comparison itself remains in H1. |
| 30–31 | PPG 1 → DiamondSixOperations S5, SmoothRepresentationsOfLocalGroups SR.1 | Supernatural order and finite-index divisibility give exactly the denominator condition for normalized averaging. They do not assert averaging when those denominators are nonunits. |
| 32 | PPG 3 → ReductiveGroupsPartII RG2.3 | The inverse-limit characterization is the abstract input to proving congruence subgroups pro-p; group-scheme and filtration arguments remain with RG2.3. |

The Belyi endpoints are existing **retained dependency specifications**, whose text assigns ownership to ProfiniteArithmetic and BelyiArithmeticActions. Neither successor currently has a stage ID in this catalogue. I made that limitation explicit in the link reasons, rather than inventing endpoints or treating the Belyi stages as completed declarations.

## Seven overlap decisions

All seven `rescope` recommendations remain, with the following boundaries. These are proposals for the maintainer, not edits to upstream roadmaps.

1. **Continuous sections:** the finite-kernel theorem is the normalized special case of PC 0's closed-subgroup quotient theorem. Share that proof/interface; the finite-case elementary argument can be retained at its owner.
2. **Closed-subgroup continuity:** PPG 6 explicitly plans the colimit, while PC 11 gives an unnamed limit route. This is an overlapping proof obligation, not evidence of two fully stated identical declarations. The proposed theorem must take a discrete **G-module**, restricted to H and each open U; an arbitrary H-module supplies no U-action. PC's closed-subgroup Shapiro route is also available. No reverse dependency on PPG 6 is introduced.
3. **Trivial coefficients:** the ℤ-linear and ZMod-p-linear objects have the same underlying coefficient module, but are not definitionally the same categorical object. A restriction-of-scalars comparison and pairing compatibility are required. The PC 13 attribution is supported by the surrounding universe convention and QFI's supplier contract, not a full isolated PC 13 construction.
4. **p-adic powers:** the old proposal extended an upstream stage despite its explicit boundary. Preserve PPG 4's abelian API; the planned ProfiniteArithmetic successor supplies the general powers and proves their comparison. Record the PPG classification's missing nonabelian-power interface without creating nonexistent successor links.
5. **Completed group rings:** retain one ℤ_p carrier and compare broader coefficients under stated hypotheses. An arbitrary complete adic R has not been given a continuous ℤ_p-algebra structure, so the old unrestricted completed-tensor comparison was unjustified. Action comparisons need their stable-open-submodule hypotheses. Compact Hausdorff lifting is not interchangeable with mere separatedness and completeness. NE.0 imports the noncommutative carrier already provided by PMIA.
6. **Coordinates and division:** retain the specialized upstream input and prove comparisons with PMIA's broader theory. Do not import the claim that the topology is T-adic or defined by group-projection kernels alone: p^n tends to zero in the compact topology but not T-adically, and the finite group quotient uses `(1+T)^{p^n}−1`. The comparison must account for coefficient quotients as well. General division is an extension with a compatible specialization, not another construction of the same base theorem.
7. **Embedding problems:** share the abstract carrier and weak-solution predicate. The p-group-kernel reduction proves weak solvability; properness and local arithmetic prescriptions remain IG.4's responsibility.

## Completeness check and additions

I independently searched all 2,007 stage descriptions for suppliers and consumers of **PPG Layers 0, 1, 3, 4, 5, 7 and the Layer 9 prerequisites**, using their completion, order/index, Frattini/quotient, free-group/module, embedding-problem, Euler and completed-algebra contracts. I read additional candidate stages IntegralIwasawaTheory I.2/L1, IntegralHeckeAndGaloisDeterminants IHG.4 and FunctionFieldArithmetic FA.4 in full.

Two missing inputs are added with the required `addedBy` marker:

- **33: PC 10 → PPG 7.** For a coefficient short exact sequence the three-term Euler argument needs exactness at H²(G,C) followed by H³(G,A)=0 under `cd_p≤2`. PC 5 explicitly ends its exactness claims at H²(G,B); PC 10 supplies the missing endpoint. The existing PC 5 link is retained for its genuine lower-degree uses.
- **34: GrothendieckEulerForms 5 → PPG 7.** The three-term Euler argument uses the same finite exact-sequence additivity as the two-term argument, with explicit finiteness and vanishing hypotheses. This is the supplier's general finite-support formula specialized to finrank.

The existing LocalFieldsRamification packet already carries the PPG supplier links; they are not duplicated. FA.4's topological idele-class completion is not automatically the completion of an underlying abstract group, so its wording does not establish a new use of PPG 0's exact universal property. IHG.4's unspecified coefficient ring does not establish a use of the ℤ_p-only completed algebra. The arithmetic inverse-limit stages have their own coefficient/module and PMIA interfaces; the mere appearance of abelian pro-p Galois groups does not establish another direct edge. The matched adic-space Weierstrass theorem is about convergent Tate algebras, not the same formal-power-series division contract.

## Validation

- `python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_ProfiniteProPGroups.json`: **34 links, seven overlaps, 217 examined; zero errors and zero warnings**, including the cycle check against the atlas and other packets.
- All **109 evidence excerpts** checked as raw substrings of their named stage or roadmap document. Restored source whitespace in 53 excerpts; mathematical text was not rewritten inside quotations.
- Intake check passes for the two deliverables. Only the packet and this report are changed for this job.
- No git command was run for this review; submission uses the GitHub API. Lean: not applicable; no compilation or formalization claimed.
