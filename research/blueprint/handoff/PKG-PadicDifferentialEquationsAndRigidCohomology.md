# Handoff: PKG-PadicDifferentialEquationsAndRigidCohomology

Issue #9854. Worker: Claude (Opus), session `claude-Y7BNdS`. The package is complete and is submitted for its independent review (REV-PKG, #9855).

## Deliverables

- `research/blueprint/packages/PadicDifferentialEquationsAndRigidCohomology/README.md`: the roadmap in TauCetiRoadmap form. It has a Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, TauCetiRoadmap, and other roadmaps by section) and How to read the build. Then come Layers RD.0–RD.7 with 529 targets (`### RD.k.n`), each layer closing with Examples and Dependencies, followed by Downstream consumers, Corrections to the sources (the plan's 148 source corrections, given as correction and reason only) and References. Of the 529 targets, 503 are the targets of the nine accepted packets, in the reader document's prerequisite order. The other 26 are new targets that answer supplier contracts and gaps no lower-tier roadmap states (ledger below).
- `Suggested.lean`: 1,260 lines, one import block (`import Mathlib` plus six Tau Ceti modules), one module docstring, namespace `TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology`, and one `/-! ## Layer RD.k -/` section per layer with sub-namespaces `RD0`–`RD7`. It holds only light real-bodied predicates and functions on carriers at the pins (valuation bases, Katz's candidate, Frobenius equivariance, monodromy and Tate-twist relations, growth conditions, finite index, the Laurent residue pairing, ι-weights, Dwork and Kummer characters, Kloosterman sums, elliptic Weil factors, precision exponents), milestone theorems proved by `sorry`, and examples. The 45 README targets with declarations say so ("`Suggested.lean` declares …").
- `metadata.toml`: `topic = "math.NT"`.

## Checks run

- `lean-check …/Suggested.lean`: exit 0, no errors, 76 warnings, all `declaration uses sorry`. `scripts/check_sorry_data.py`: clean.
- A coverage script (in scratch, not committed) checked the README:
  - every packet target has a heading (503) and the 26 new ones are present;
  - every packet API name appears in its target;
  - every definition and construction has at least three Checks;
  - 3,344 internal links resolve, and no target needs a later one.
- Residue scan for packet, node, gap, request, review, first-pass, inherited and similar words, plus a Sonnet proofread of the whole README in six chunks.
  - The proofread returned 1,130 findings. About 600 were applied as exact-substring replacements, each only where the string is unique in the README; the rest were rejected (test-name labels on Checks, supplier section labels, the Examples/Dependencies/consumers sections, deletions of supplier citations) or were already handled by generator rules.
  - Sixteen local mathematical slips were fixed:
    - the Kloosterman determinant weight n(n + 1);
    - the Kummer-cover projector (1/d) f^* ∘ Tr_f;
    - the finite étale trace f_*O_{X′} → O_X;
    - several undefined or doubled symbols (d/n, V/O_K, j_! j^*, ψ, M_μ, rank(E)).
  - The HLTT expansion was corrected to Harris–Lan–Taylor–Thorne.
- `python3 research/blueprint/intake.py check-files` on the four files: see the PR.

## Supplier contracts and gaps of the plan: dispositions

The plan carries 31 supplier requests and 39 gaps. Each was checked against the lower-tier package READMEs (tier < 12), the current TauCetiRoadmap checkout and the libraries. None is left open in the README.

- **Supplied by a lower-tier package** (cited by section in *Needs* and in Exact supplier contracts):
  - CrystallineCohomology CR.3 (§§CR.1.2, CR.1.4, CR.3.2, CR.3:Frobenius-isogeny.1);
  - NeronModels §5.3 (period rings);
  - FiniteFlat §§R07.3.2–R07.3.3;
  - AdicSpacesPartII §§R2.72, R2.12–R2.13 (Raynaud fibre, specialisation) and §§R3.55–R3.56 (GAGA);
  - AdicCoefficientsAndComparisons §L2 (Nagata);
  - SchemeAndStackFoundations §SF.4e T415 (de Jong);
  - InverseGalois §§IG.1.1–IG.1.2;
  - EnhancedDerivedSheaves §§E1.2–E1.4, E2.6, E3.4;
  - DeligneWeightsAndPurity §2.7;
  - ArithmeticGaloisRepresentations §§2.6, 3.x, 6.3 and AbelianSchemes §§A5.7, A6.11.
  - From TauCetiRoadmap: AlgebraicCurves Layer 9, JacobianChallenge Layer F, ReductiveGroups Layers 1–3 and EllipticCurves Layer 3 (supersingular iff p | a).
- **ℓ-adic trace formula and étale π₁**: cited to TauCetiRoadmap pull request #196 (TraceFormula Layers 12–13, ConstructibleEtale Layer 3), as the InverseGalois package already does. This is the one citation of an unmerged upstream roadmap.
- **New targets in this package** (no lower-tier owner states them; each comes with sources and Checks):

| New target | Answers |
| --- | --- |
| RD.0.39 Arabia's controlled lifting | request SF.0/Arabia §§1–2 |
| RD.0.40 weak-completion collapse | request F1/Arabia §3.2 |
| RD.0.51 char-p Ax–Sen | request P3 |
| RD.0.54 Fargues–Fontaine coefficient rings | request to RD.0, gap G3 |
| RD.1.60 Newton polygons and roots | gap G2 |
| RD.2.45 upper numbering over a perfect residue field | gap inherited from R01.3 |
| RD.3.26 rank-one coordinate change | the Quillen–Suslin gap |
| RD.3.43 Newton-polygon purity | gap G4 |
| RD.4.43 weak-formal log exactification | request to CR.5 |
| RD.5.5 ample sections and finite projections | request to SF.0 |
| RD.5.30 Fréchet Mittag-Leffler | request L0 (e) |
| RD.5.40 locally convex duality inputs | request L0 (a)–(d), plus the four L0 ids the LAD package does not state |
| RD.5.70 universal cohomological descent | request to E2 |
| RD.5.98 imperfect-residue rigid–crystalline comparison | gap |
| RD.5.107 relative log convergent sites | gap |
| RD.5.108 log isocrystal perfectness | request to CR.5 |
| RD.5.115–117 liftable direct images, Zarhin's trick, abelian-scheme overconvergence | gap "still to be planned at RD.5" |
| RD.6.5 LF nuclear trace | requests to L4 and two gaps |
| RD.6.53 algebraic Euler–Poincaré formula | gap |
| RD.6.62 geometric class field theory | gap |
| RD.6.71 Lie normalisers | request to ReductiveGroups and gap |
| RD.6.94 Kloosterman relative cohomology | gap |
| RD.6.96 localized Fourier transform | gap |
| RD.7.11 supersingular traces | gap |

- **Gaps that were only "source not read"**: the README cites the source for the proof. This covers Ogus 1984/1990, Crew 1987, Abe 2011, Tsuzuki 1999 (Hiroshima Math. J., open access), Le Stum's book §6.4, Christol–Mebkhout IV, Mieda 2007 and Berkovich.
  - The G1/G5 analytic inputs are cited to Kedlaya's *p-adic Differential Equations*, which the author posts freely. Theorem numbers and printed pages were checked (printed page = PDF page − 18): 10.4.2 p. 173, 10.5.1 p. 174, 10.6.2 p. 177, 10.7.1 p. 180, 11.3.2 p. 189, 12.4.2 p. 209, 20.4.2 p. 332, 1.3.7 p. 20, 6.7.1 p. 109, 6.7.4 p. 111, 2.1.5 p. 37.
  - Bosch's Lemma 2.2/7 (p. 16) and Corollary 2.2/11 (p. 19) were checked in the cleared copy.
- **C_dR and C_st** (owned above this tier): RD.7.21–RD.7.22 now state the two comparison isomorphisms as explicit hypotheses (C_dR) and (C_st) and do not import them. The unconditional statements belong to the comparison roadmaps, which build on this one.
- **Nonflat strengthening** (Kedlaya, Finiteness 7.2.1): the target keeps flatness, as the plan has it. The failure without flatness is noted under Corrections.

## Changes relative to the plan (for the reviewer)

- Twenty-six new targets, listed above, are placed before their first user in their layer.
- Titles beginning "Acceptance:" became "Example:" or "Counterexample:"; a few titles lost bookkeeping, for example "Weil-factor export …" became *Weil factors of smooth proper varieties over finite fields*.
- RD.7.21–RD.7.22 now carry the comparison hypotheses.
- The higher-dimensional rank-one statement (Abe, Lemma 6.1) is kept as a cited statement; the weight theorems use the curve case.
- No packet was edited.

## Moved down into this roadmap

Several new targets naturally belong to lower roadmaps, whose packages do not state them. The maintainer may relocate them; until then they are owned here:
- Arabia's lifting and the weak-completion collapse (SchemeAndStackFoundations / AdicSpacesPartII F1);
- characteristic-p Ax–Sen (PerfectoidSpaces);
- locally convex duality, Fréchet Mittag-Leffler and LF nuclear traces (LocallyAnalyticDistributions L0/L4);
- the universal cohomological descent calculus (EnhancedDerivedSheaves E2);
- upper numbering over perfect residue fields (ArithmeticGaloisRepresentations R01.3);
- Zarhin's trick (AbelianSchemesAndArithmeticModuli);
- geometric class field theory for curves (InverseGaloisAndArithmeticFundamentalGroups IG.1);
- Lie normalisers (ReductiveGroups).

## Notes for the reviewer and the maintainer

- **Size.** The README is about 1.68 MB (15,174 lines) for 529 targets, about twice CrystallineCohomology's 834 KB. GitHub may not render a Markdown file this large. If the maintainer wants it split, the natural Parts are RD.0–RD.2 (local theory), RD.3–RD.5 (coefficients and cohomology) and RD.6–RD.7 (traces, weights, Weil factors).
- **Locators to verify.** Those of the 26 new targets were chosen in this run.
  - Read in the source: Kedlaya's book, Bosch, Arabia (plan), Fontaine–Ouyang (plan), Shiho (plan), Zureick-Brown (plan), Crew 1998 (plan), FSY (plan).
  - Checked by retrieval agents: Waterhouse Thm 4.1 (p. 536), Étesse 2002 Thm 7 (p. 599), Tsuzuki 2003 (Thms 4.1.1, 4.1.4, 3.3.1; Prop. 2.3.1) and EGA 0_III (13.2.4)(i) (p. 67).
  - Not verified:
    - Katz–Lang Theorem 1: e-periodica blocks downloads with a challenge.
    - Schneider–Teitelbaum: cited by §1 only, because the arXiv id at hand was a different paper.
  - Cited by section only: Serre's *Local Fields*, Humphreys, Milne's *Algebraic Groups* (Cartier's theorem), Moret-Bailly, Deligne LNM 163 and Malgrange.
- **Duplication.** Current TauCetiRoadmap and Tau Ceti (a91d3aaf) contain no Robba, isocrystal, rigid-cohomology, Dwork or Kloosterman objects. The library items used (Gauss norms, Laurent and Hahn series, rank-one isocrystals, Tannaka reconstruction, elliptic point counts) are cited, not planned.

## Resume

The independent package review, REV-PKG-PadicDifferentialEquationsAndRigidCohomology (#9855).
