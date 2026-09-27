# BP-MetaplecticAutomorphicForms--MP.8 handoff

Worker: Codex — codex-hjdg0j. Issue: #772. Claim comment 5851313060;
winning bot reply 5851314012 was read before work. Snapshot:
8ba49bd1dd6debd132e37b3cf8a6164f6ff7eae4. Only the four authorized deliverables
are changed. Status is **partial**; do not mark MP.8 complete.

## Delivered component

Nine declaration nodes: two constructions, five lemmas and two theorems. They
provide the integral genus-two Fourier-index shift, the discriminant quadratic
form, invariant residues, recovery at fixed vector, uniqueness of the shift
parameter, orbit classification, uniqueness for a prescribed residue lift and
coefficient equality conditional on actual shift invariance. The node graph
ends in checked native declarations and elementary integer algebra.

There are eight API items, six definition tests, ten total example statements,
three planets, eighteen baseline declarations, three gaps, two external requests,
three source findings and one ownership rescope proposal. All implementation
statuses remain unchecked. The plan does not claim an analytic coefficient,
Jacobi form, double cover or Eisenstein series has been constructed.

Use native pairs (Q,R), with Q a Z-valued quadratic form on Z². Do not replace
them with a newly invented half-integral symmetric-matrix wrapper. The crucial
normalization is a=m/N, c=N for j=0 and c=1 for j=1; source U equals N times the
symmetric matrix of Δ=4aQ−c(R·−)². The invariant is the full quadratic form,
not its determinant. Classification needs a≠0; construction and invariance do
not. Keep the arbitrary prescribed residue lift distinct from a canonical one.

## Sources and findings

Published BFH Invent. Math.102(1990),543–618 scan:
https://wstein.org/papers/bib/bump-friedberg-hoffstein-nonvanishing.pdf

SHA-256: d50ad2f11c992591de90f2cea59489ac436cce455e140e6eebf5053f49819f2c.
Read on 2026-09-27. Physical page1 is a repository cover sheet. Rendered physical
pages2–16 correspond to printed543–557, and physical72–77 to printed613–618.
All reads were batched at most three physical pages. Full §§1–2 and §9 were
read; the opening of §3 and ending of §8 were read. Printed558–612 remain
unread. The source PDF is scanned, so rendered pages rather than extracted
empty text were inspected. Physical6,7,9 were also viewed at higher resolution
to check the Fricke transform, stabilizer and functional equation.

Three source issues are recorded with checks: E-MP8-1 reverses m|N to N|m,
confirmed by the explicit §9 choice; E-MP8-2 includes positive central scalars
in the GSp⁺ stabilizer, with 2I₄ as counterexample; E-MP8-3 restores M in the
original level-M newform's Fricke equation and completion while retaining N in
the separate seed transform. The publisher page
https://link.springer.com/article/10.1007/BF01233440 and Friedberg's publication
list were searched for corrections, together with exact-title web searches.
No addressing correction was found. These are proposed findings for independent
review, not an accusation that the main theorem fails.

The distinct BFH Annals131(1990),53–127 paper, the relevant Weil/Kudla sources,
and the Jacobi inputs referred to Eichler–Zagier and Ziegler have not been read
in this job. Do not describe the full source list as decomposed.

## Ownership and prerequisite checks

The full reviewed AUDIT-15 MP.8 row was read before planning. The campaign
README, complete MP.8 stage, all17 touching edges, MP.0/MP.7, AS.1/AS.2, BSD.2
and QM.1 stage descriptions were read. The link screen found zero stage-specific
entries and29 roadmap-only screens. There was no existing Metaplectic packet
or integrated MP.8 decomposition at the checked snapshot.

Five precise QM.1 nodes and their hypotheses/proofs/prerequisites/sources were
read: jacobi-form, jacobi-fourier-coefficient, jacobi-coefficient-discriminant,
theta-decomposition and theta-decomposition-weil-representation. They are
rank-one statements and retain their existing ownership. Its four MP requests
name MP.7. The packet proposes a rank-one/genus-two distinction in the stage
wording and does not introduce a reverse MP.8→QM.1 prerequisite. MP.0 supplies
the Heisenberg foundations. AS.1–2 requests ask for explicit linear-group
analytic inputs; MP.8 must prove the adaptation to the double cover. BSD.2 owns
the twist-series comparison and final residue/local-condition argument.

Both pinned trees were searched. Native QuadraticForm, linear-form products,
ordered-basis expansion, dotProductBilin and Int.ModEq were read and reused.
The root namespace of dotProductBilin was checked in Lean. The generic
symplectic matrix group and semidirect product are boundary declarations;
neither is the BFH cover. GrothendieckEulerForms and JacobianChallenge upstream
documents were read in full during the session and verified unchanged here.

## Validation

The suggested file compiled with Lean4.34.0-rc2 against the pinned Mathlib
source imports: exit0, zero errors,25 warnings, all required proof placeholders.
It contains two constructions,15 named proof/API signatures,10 examples and
three declaration checks. All1,791 imported Mathlib source files were verified
against the pin and compiled-cache source bytes; no Tau Ceti modules are
imported. The native definitions have explicit expressions; theorem and example
proofs are placeholders and no implementation claim follows.

Suggested-file SHA-256: 14e4f1684a86e4a60d221e79cd867dff6916d9312c02c0bbf9752b53b804a350.

The indexed packet checker reports zero errors and zero warnings. Intake reports
four files and zero problems. Source-issue/version schema checks pass. Every node,
API and definition-test name matches the suggested file; the internal graph is
acyclic and only the four deliverables differ from the starting archive. Fresh
main 8f6fe5b8ff79f514c6c42a430b1813e4eae48ea5 leaves all60 guarded inputs
unchanged and adds no relevant supplier packet. The issue body, active claim and
winning bot reply were rechecked. The packet has28 acceptance properties.

## Resume

1. Group and analytic objects in BFH §1, pp.545–551: use the native symplectic group and generic semidirect product, import the Heisenberg data from MP.0, and construct the actual positive-similitude GSp4 group, action on H₂, double cover, compatible Jacobi action, arithmetic subgroup and adelic realization. Resolve the stabilizer and level misprints recorded here. Specify slash-operator branch, central character, K-type, section I_s and the original newform versus its Fricke transform. Every new definition needs its API and three tests.

2. Theta and Fourier analysis in BFH §2, pp.551–557: construct genus-two theta series, prove normal convergence, Gaussian orthogonality (Proposition 2.1, whose proof is omitted in BFH and referred to Eichler–Zagier Theorem 5.3), Fourier extraction (2.2)–(2.3), and the holomorphic contour translation establishing (2.9). Then instantiate coefficient-invariants for B_j, establish the half-integral matrix/native quadratic-form dictionary as a reusable interface, prove Proposition 2.2 including the S-transform/branch and infinite-sum regrouping, and split Propositions 2.3, 2.5, 2.6, 2.7 and Corollaries 2.4, 2.8. Rank-one Jacobi forms and their already planned coefficient/theta results remain QM.1; no reverse MP.8 dependency on that consumer is introduced.

3. Cover-specific analysis: physical pp.17–71, printed558–612, are unread. Read and decompose the remainder of §3 and §§4–8 line by line: actual Whittaker kernels and K-types, local test functions, Eisenstein/Fourier coefficient expansions, initial convergence, constant terms, intertwining operators, meromorphic continuation, functional equations, singular hyperplanes and justified coefficient/residue interchanges. The beginning of §3 at p.557 and the end of §8 at pp.613–614 are read boundaries, not evidence that their intervening proofs are closed. Adapt AS.1–2 estimates to the double cover with explicit comparison theorems.

4. Complete source coverage: the campaign references Weil (1964), Kudla (1996), BFH/Friedberg–Hoffstein routes, and BFH cites Eichler–Zagier and Ziegler for Jacobi foundations. Obtain and read the passages required for the exact objects and proofs, resolving ownership against MP.0–7 and QM.1. The distinct BFH Annals131(1990),53–127 paper has not been read in this job and must not be confused with the Inventiones paper. No source-complete claim is made.

5. BSD.2 export: state and prove the precise genus-two coefficient, local-factor, continuation and permissible-interchange outputs consumed by the twist-series comparison. BFH §9, pp.614–617, has been read to confirm m=N·rad(N), separation by K-types, the two-variable pole argument and infinitude of fundamental discriminants; the final twist residue, positivity/nonvanishing and simultaneous local-condition selection belong to RankZeroOneBSD:BSD.2 and are not nodes of MP.8. Reading the final argument does not supply its unread §3–8 premises.

Start with the actual Fourier coefficient and the contour translation on pp.552–553, preserving these node ids and the native quadratic-form interface. Acquire the cited orthogonality proof and justify the infinite sums before claiming the theta expansion. Read printed558–612 in batches of no more than three physical pages, inventorying each definition and key theorem and keeping BSD.2 ownership explicit. Recheck fresh main for suppliers and retain every correct existing item.
