# Combinatorics fixes, round 2

Job: **FIX-RT-AREA-combinatorics~2**, issue #5163. Agent: **Codex**;
session **codex-rtOQ9t**; date **2026-09-30**; base **138b3b1**.

The authorized follow-up is complete: the EllipticRegulators packet, reader and
suggested file now implement finding /14's reuse boundary; RS-03 records the
correct two normalizations; the ABS extraction directs its unfinished AC.5 work
to the blueprint job. Existing round-1 mathematical corrections are retained.
This is a fix submission for independent review, not a new acceptance verdict.
EllipticRegulators remains a **partial** blueprint with its existing 12 gaps.

Inputs: [verified findings](RT-AREA-combinatorics.review.json),
[round-1 report](RT-AREA-combinatorics.fixes.md), the current six deliverables,
reviewed AUDIT-16, and the declarations at Mathlib **082e2d3** / Tau Ceti
**f790474** listed below. The issue's unfinished-blueprint handoffs and current
PROTOCOL §17 determine where the remaining work belongs. Round 1's recipes to
edit campaign/atlas data directly are superseded by those blueprint handoffs.

## /14: the implemented Fourier specialization

The general finite-abelian coefficient and comparison interface belongs to
**AdditiveCombinatorics:AC.0**. For finite abelian G, it exports

- A(f)(χ) = |G|⁻¹ Σ_x f(x) conj(χ(x));
- inversion f(x) = Σ_χ A(f)(χ)χ(x);
- Parseval |G|⁻¹ Σ_x |f(x)|² = Σ_χ |A(f)(χ)|²;
- the convolution/product identity with normalized convolution;
- comparison with basis coefficients, counting coefficients |G|A and unitary
  coefficients √|G|A.

The new packet request states this contract, its pinned ingredients and its
upstream-specialization comparisons. It imposes no whole-stage coding or
modular-forms prerequisite. AC.0 does not rebuild generic character theory.

ER.4 retains the explicit C-torsion formula and dual identification
χ_(k,ℓ)(a,b)=exp(2πi(ak−bℓ)/C). It imports generic inversion and Parseval through
that identification and keeps the torsion oddness and regulator identities.
New local API signatures compare the transform to `AddChar.complexBasis.repr`
and to two `ZMod.dft` calls at indices (k,−ℓ). They specify specialization of
the AC.0 contract, not a second general transform. ER.5 scales this interface
and retains the order pairing and its multiplicative compatibility.

### Preserve Lecture 10, Lecture 11 and the corrected sign

Round 1 explicitly did not read Lecture 10. Its suggested ER.4 replacement
described only Lecture 11's 1/C normalization. Applying it literally would
regress the reviewed packet. This follow-up instead re-read the programme's
supplied Bloch 2000 scan, SHA256
`9715a312ec4ebb9535daa24f3308bb5b97152211d747d55bf9f6c06bb221bd60`:

| Printed page (PDF page) | Checked content |
| --- | --- |
| 76 (88) | (10.2.1): factor 1/C² and exponent −ak+bℓ |
| 87 (99) | (11.1.1): factor 1/C and the printed opposite pairing |
| 89 (101) | pairing and Lemma 11.1.4, including the order basis |
| 91 (103) | proof of Lemma 11.1.7 uses the dual argument first |

Thus Lecture 10 is AC.0's average on C² points; Lecture 11 is the unitary
transform. Keep the reviewed E7 correction: F̂(x)=C⁻¹Σ_y F(y)⟨x,y⟩.
No new source-error verdict or alteration of E7 is made here.

For f(m,n)=F(n+mτ), the comparison is
`finiteFourier10 C f (k,ℓ) = C⁻¹ fourierO C F (k,ℓ)`.
Only the input coordinates are swapped. The previous suggested file also
swapped the output; that contradicted the packet's statement and is now fixed,
along with its stale `source issue E1` comment (the issue is E7). The reader's
old ER.4 single-factor claims are corrected and both complete Fourier nodes
are documented beside their layers. RS-03's link reason now preserves both
scales and the corrected kernel.

The new tests distinguish averaging from unitary normalization and detect the
output swap: C=3, F=δ_(1,0) gives F̂(0,1)=exp(2πi/3)/3 but F̂(1,0)=1/3.
There are also C=1, character-basis and point-mass Parseval tests. Existing
odd-character sign tests and regulator constants remain unchanged.

### Pinned statements read, not inferred from names

| Declaration | Module at the specified pin | Use / limitation |
| --- | --- | --- |
| `AddChar.complexBasis` | Mathlib `Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:125` | Existing complex-character basis |
| `AddChar.sum_apply_eq_ite` | same, :188 | Existing character-column sum |
| `AddChar.wInner_cWeight_eq_boole` | Mathlib `Analysis/Fourier/FiniteAbelian/Orthogonality.lean:60` | Normalized character orthonormality |
| `ZMod.dft`, `ZMod.dft_dft` | Mathlib `Analysis/Fourier/ZMod.lean:88,177` | Counting normalization; negative kernel; double transform N times reflection |
| `CommGroup.sum_monoidHom_apply_eq_ite` | Tau Ceti `GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104` | Finite commutative G, domain M with enough roots of unity, characters valued in Mˣ |
| `TauCeti.hasSum_norm_sq_peterWeylCoeff` | Tau Ceti `RepresentationTheory/Compact/PeterWeyl.lean:599` | Parseval for an irreducible skeleton in L²(haarProb); character indexing still needs comparison |
| `TauCeti.haarProb_eq_smul_count` | Tau Ceti `RepresentationTheory/Compact/Finite.lean:212` | Finite discrete Borel group: Haar probability equals normalized counting |

These statements and ambient hypotheses were read at the pins. The packet
baseline now carries their citations. AUDIT-16's **partly built** verdict is
correct and unchanged; its omitted Tau Ceti column-orthogonality citation is
supplied here for the AC.0 blueprint/audit follow-up. The frozen audit is not
an authorized deliverable. Haar Parseval alone is not claimed to supply the
missing character/coefficient comparison.

## Disposition of every confirmed finding

Numbers below refer to `RT-AREA-combinatorics/<number>`. “Handoff” means work
assigned to the unfinished blueprint under the issue's explicit instructions;
it does not mean the source theorem has been formalized or its closure proved.
The detailed source contracts already written in round 1 remain useful evidence,
subject to the verifier's corrections and the Fourier corrections above.

| Finding | Disposition in this round |
| --- | --- |
| /2 | **BP-AdditiveCombinatorics, AC.2**: choose the exact equation/system; supply directed fixed-H / colored removal for the Král–Serra–Vena route. Undirected triangle removal alone does not suffice; not all systems require hypergraph removal. |
| /3 | **Already fixed in RS-03**: AC.2 consumes pinned Roth, Behrend and van der Waerden, retains stronger quantitative/correspondence and k≥4 work. Preserve the `ThreeAPFree` characteristic-two convention. BP-AdditiveCombinatorics must realize this narrowing; the audit already has Roth evidence. |
| /4 | **BP-AdditiveCombinatorics, AC.3**: corrected GTZ v5 and separate errata, LSS quasipolynomial inverse theorem and Leng quantitative equidistribution, with the box interfaces used by Kai. If the older GTZ proof route is retained, its limit-object prerequisites remain obligations. |
| /5 | **ABS correction already present**: item /35 and route 3 give Kai's exact weighted number-field statement and supplier requests to AC.3, AN.4, FF.2 and SV.2. The Kai branch has no AC.4 majorant input; other branches may. Updated route 3's obsolete direct-maintainer-edit instruction to the **BP-AdditiveCombinatorics** handoff. |
| /6 | **ABS correction already present**: item /33, route-5 brief, G1 and the Kai Mitsui prerequisite distinguish the application replacement from Kai's Siegel-corrected internal input. Preserve the precise growing modulus range and the v3 renumbering. G1 remains open; it is not that stronger theorem. No unrelated route/owner change. |
| /7 | **BP-AdditiveCombinatorics, AC.5**: source-specific SV.2 Type I/II and AN.3 progression estimates for Möbius–nilsequence orthogonality, including constants/ineffectivity; distinguish the separate Λ application. |
| /8 | **BP-AdditiveCombinatorics, AC.4**, with **BP-AnalyticNumberTheory--AN.0**: choose and fully state the GT2008 route, or a separate CFZ branch. Dense-model wording cannot stand in for the missing theorems. Remove analytic inputs only after checking the complete selected replacement proof. |
| /9 | **BP-AdditiveCombinatorics** and **BP-SieveMethodsAndPrimePatterns**: remove the unsupported SV.3→AC.4 consumer obligation in their plans; retain the exact majorant/counting and Möbius suppliers. RS-07 is outside this issue's files; its corresponding deletion must accompany that reviewed follow-up. |
| /12 | **BP-AdditiveCombinatorics, AC.1**: GN.1 Minkowski II supplier for the chosen Tao–Vu Bohr/progression route, with cyclic bound (ρ/d)^d N under 0<ρ<1/2; distinguish the general coset-progression statement. |
| /13 | **BP-AdditiveCombinatorics** and **BP-ArithmeticLocallySymmetricSpaces**: shared unfiltered nilmanifold quotient/lattice carrier, independent of the inverse theorem. Preserve the proposed LieGroups Part II ownership of global nilpotent exponential/BCH and smooth quotients; rational Mal'cev data, filtrations and complexity stay in AC.3. AC.3a in round 1 is a proposal, not an already existing supplier. No forced whole-stage or cyclic ALS input. |
| /14 | **Applied** to all three authorized EllipticRegulators files and RS-03, with a precise AC.0 request and pinned imports. **BP-AdditiveCombinatorics** supplies the general interface. See the full correction above. |
| /15 | **BP-AdditiveCombinatorics**: remove unsupported CA.2 and retired LI.2 inputs, update the layer summary through AC.5 and identify actual imports; no blanket compact-groups dependency. |
| /16 | **Already fixed**: canonical RS-03 uses AUDIT-16, with no AUDIT-06 occurrence. Its generated mirror remains orchestrator-owned. |
| /17 | **BP-AdditiveCombinatorics, AC.2**: bind prime N sufficiently large (N≥k) and nonzero difference, or use a distinct-term interval statement. The r=0 subtraction in an acceptance test does not fix an underspecified theorem. |
| /18 | **BP-AdditiveCombinatorics**: one complex conjugated-cube definition on finite abelian groups, U¹ only a seminorm, plus exact interval/box normalization comparisons. GT2008's real prime-cyclic formula is a specialization. |
| /21, /22, /24, /25, /26, /27, /30 | **Upstream notes only**, AlgebraicCodingTheory and, for /22, IntegralLattices. Current WORKERS/PROTOCOL forbid changing, mapping or reviewing Tau Ceti's own plans here. See the grouped `upstreamNotes` below and existing central notes. |
| /29 | **Maintainer/GeometryOfNumbersAndQuadraticArithmetic GN.4 handoff**, outside the authorized files: resolve ACT-O03/ACT-R02's meaning of “lattice codes.” If Construction A is selected, consume coding Layer 6 and put real scalar-extension/norm/covolume comparisons in GN.4. Keep positive dimension and nonzero-code/minimum conventions. Do not add an unconditional edge before this choice. This is an Atlas consumer contract, not authority to change the upstream coding roadmap. |
| /32, /33, /34, /35, /36, /37, /38, /39, /40, /41, /42, /43, /44 | **Upstream notes only**, DenseGraphLimits and its upstream suppliers. No dependency/status refresh or replanning here under current policy. In particular /38's upstream arity-3 programme cannot silently become an all-arities supplier for future AC.2 work. |

Rejected findings /1, /10, /11, /19, /20, /23, /28 and /31 are not revived.
In particular this round does not force AC.2 through AC.3, replace the fixed
library baseline, or impose sampling as the only separation proof.

## Upstream notes

These record the pre-existing verified observations for the maintainer, not a
fresh attack or review of Tau Ceti. The current policy supersedes round 1's
upstream edit/graph-refresh recipes. `UPSTREAM_NOTES.md` already collects /21,
/22 and /32–37, /39–40; it is not an authorized file in this job. Retain the
following additional low-severity/provenance observations alongside them:

```json
{
  "upstreamNotes": [
    {
      "roadmaps": ["tauceti:TauCetiRoadmap/AlgebraicCodingTheory", "tauceti:Completed/IntegralLattices"],
      "note": "Existing verified RT-AREA-combinatorics/21, /22, /24, /25, /26, /27, /30: even-modulus Type II scope; finite-family lattice/discriminant interface; ordering/forward references; gluing API locator; baseline provenance; coefficient ring of the square-root normalized MacWilliams transform. See the verification and round-1 evidence. No upstream changes or new upstream-to-upstream links are proposed by this fix."
    },
    {
      "roadmaps": ["tauceti:TauCetiRoadmap/DenseGraphLimits", "tauceti:TauCetiRoadmap/OptimalTransport"],
      "note": "Existing verified RT-AREA-combinatorics/32–44: sampled-cut estimates; atomless/global-model distinction; compactness/martingale and conditional-expectation interfaces; reflection positivity; coupling comparison; the separate upstream regularity proposal and overlap; graph/status provenance; projective-limit adapter; citation and measure-preserving API corrections; triangle/weak-regularity ordering. These belong upstream under current PROTOCOL §§10,17, not in Atlas blueprint or link edits. Rejected /31 is not revived. The detailed individual verdicts remain in RT-AREA-combinatorics.review.json."
    }
  ]
}
```

## Validation and remaining boundaries

Checks passed:

- `scripts/check_blueprint.py`: 75 nodes, 123 API items, 88 unit tests,
  37 requests; zero errors/warnings. The missing declaration-index warning
  means its reference-name checks are only syntactic; the new references were
  checked manually at the pinned sources as recorded above.
- `scripts/check_restructure.py` and `scripts/check_paper.py`: both valid.
- `research/blueprint/intake.py check-files`: all six deliverables, zero problems.
- Structural guards: all 75 old node IDs, source issues, gaps and historical
  review verdicts preserved. Only the two Fourier nodes changed. All ABS items
  and source issues, and its entire route-5 brief (including the earlier LD.4
  ownership repair), are unchanged. The ABS change is only route 3's handoff
  instruction. All 11 added API/test names occur in the reader and suggested file.
- Packet dependency DAG: 75 nodes, 154 internal edges, acyclic. In the assembled
  atlas (2,840 stages, 8,258 edges), no ER.4→AC.0 path; the existing AC.0→ER.4
  link and the new request introduce no cycle.
- 24,517 finite Fourier equalities at C=1,…,7 passed at tolerance 2×10⁻⁸:
  inversion, both Parseval scales, two-DFT comparison, the fixed Lecture-10/11
  comparison, character point masses and odd-function opposite-kernel sign.
  Inputs were every point mass, every character and the deterministic complex
  function f(a,b)=((3a+b+1) mod 7)+i((a−2b) mod 5), plus its odd part.
  The wrong output swap is rejected by the C=3 example above; the averaging
  point-mass squared norm is 1/9, rather than the unitary value 1.
- `git diff --check`: clean.

Numerical diagnostics are regression evidence, not Lean proofs. The packet's
fix history explicitly awaits independent review.

The available Mathlib checkout is at 30a58f7, not 082e2d3, and the required
prebuilt Fourier module was absent. No existing build at the prescribed pin
was available for this check. The changed Lean file was **not compiled**;
no Lake project, library build, cache download or language server was started.
Memory was checked (77 GB available), so memory was not the limiting factor.
The file now distinguishes the earlier review's compilation from this uncompiled
revision. No assertion of formalization is made.
