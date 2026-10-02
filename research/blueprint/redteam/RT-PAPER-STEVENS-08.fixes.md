# FIX-RT-PAPER-STEVENS-08

Codex, session `codex-rtOQ9t`, 2 October 2026. Refs [#5539](https://github.com/CBirkbeck/tauceti-explorer/issues/5539).
Base: `d1373dd`.

All three findings confirmed by `RT-PAPER-STEVENS-08.review.json` are repaired. This worker authored the original red team, which another worker independently verified; this fix does not claim to review itself. Only this report and the extraction JSON/reader are edited. No upstream roadmap, packet, campaign or generated data changes.

## /1: relative Clifford obstruction and the determinant bridge

Item 112 now imports the actual planned **relative** Clifford obstruction from Tau Ceti InductionRestriction layer 7: for invariant irreducible η of N◁K, the obstruction to an extension preserving η lies in H²(K/N,ℂˣ). It no longer gives the false criterion on K/ker η. The upstream stage already names T/N correctly, so no upstream defect or duplicate carrier is alleged.

A normalized relative lift satisfies

\[
\rho(1)=1,\quad \rho(nk)=\eta(n)\rho(k),\quad
\rho(k)\eta(n)\rho(k)^{-1}=\eta(knk^{-1}),\quad
\rho(k)\rho(l)=\alpha(kN,lN)\rho(kl).
\]

Choose intertwining lifts on a finite quotient and extend them using N-equivariance. Schur's lemma gives the scalar normalized cocycle on K/N. Changing such a lift changes α by a quotient coboundary. If α=δc for a normalized cochain c on K/N, then `λ(k)=c(kN)⁻¹ρ(k)` is linear and still equals η on N. Conversely an extension supplies this trivialization. Absolute projective linearization allows scalar changes on N and does not impose this preservation condition.

Item 113 retains the valid **absolute** statement separately: for a d-dimensional projective representation of an acting group Q, D=det ρ satisfies δD=αᵈ, so d[α]=0 on Q. It does not assert that D descends to the relative quotient K/N, or that the relative class is annihilated by d.

Item 111's Sylow application now contains the correct relative proof. A smooth finite-dimensional representation η of the open pro-p N has open kernel: intersect the stabilizers of a basis. K-invariance of η makes that kernel normal in K. Compactness gives a finite quotient K/ker η, whose subgroup N/ker η is a finite p-group. Consequently `m=ord(det η)` is a p-power, as is the assumed `d=dim η`.

Put D(k)=det ρ(k). The normalization gives `D(nk)=det η(n)D(k)`, so **Dᵐ**, rather than necessarily D, descends to a cochain on K/N. Taking determinants gives

\[
\delta\overline{D^m}=\alpha^{dm},\qquad dm[\alpha]=0.
\]

Thus the relative class is p-primary. If η extends to S, its restriction to S/N is zero. Restriction/corestriction multiplies the same relative class by the prime-to-p index [K:S]. Bézout with dm forces that class to vanish. The relative criterion gives a smooth extension preserving η. This validates the extraction's Sylow application; it does **not** refute Stevens's extension theorem.

The exact finite-quotient/relative determinant lemma is a `requests` entry for the existing InductionRestriction owner, with hypotheses, cocycle convention, consumers and acceptance condition. `upstreamNotes` distinguishes that requirement from changing an upstream roadmap. Item 114 retains its algebraic-factor-set versus continuous-H² carrier comparison and explicitly applies the transfer to Q=K/N, S_Q=S/N. E16 remains the original confirmed J_M/J⁺_M superscript misprint; `proofContext` records the repaired implementation plan without attributing a new source theorem error to Stevens.

### Counterexample check

In K=U₃(𝔽₃), write `(a,b,c)(u,v,w)=(a+u,b+v,c+w+av)`. Its centre and commutator subgroup are N={(0,0,c)}. The faithful one-dimensional η(c)=ζᶜ has projective lift ρ(a,b,c)=ζᶜ and factor set α(g,h)=ζ⁻ᵃᵛ.

On K/ker η=K, this is δρ and has zero absolute class. Yet no character of K extends η, because characters kill [K,K]=N. On K/N≅𝔽₃², α is not symmetric: α((1,0),(0,1))=ζ⁻¹ while α((0,1),(1,0))=1. Every coboundary on an abelian group with trivial coefficients is symmetric, so the relative class is nonzero. Its values lie in μ₃, giving order exactly 3 although d=1. Here m=3 and the repaired dm bound holds. This example rejects both the old absolute iff and the relative dimension-only bound.

The pinned `IsProjectiveRep.cohomologyClass_eq_zero_iff` was read at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, `SchurMultiplier.lean:295`. Its scalar cochain has no N-preservation requirement. The actual `explicitCor2_comp_res2`, `Corestriction.lean:893`, states index multiplication on `ContCohomology.H2`; it does not identify that carrier with the relative algebraic one. No new built claim is made.

## /2: skew lattices use the fixed-field scalars

Item 78's sequence now lives in **o_{F₀}-lattices in the F₀-vector space A₋**. Ambient orders and ψ_A-dual lattices in A remain o_F-lattices; ambient commutator/corestriction maps remain F-linear. Their skew restrictions are F₀-linear, and their displayed integral maps are o_{F₀}-linear. The underlying lattice sequence Λ in V is unchanged over o_F. Route 1 carries this distinction.

The API specifies the two restricted linear maps and compatibility of exactness with the ambient construction. Its three named planning checks cover:

- The unramified unitary line F₀=ℚ₃, F=ℚ₃(i), i²=−1, h(x,y)=xȳ. Here A₋=ℚ₃i and a₀(Λ)₋=ℤ₃i, closed under ℤ₃ scalars.
- The failure of o_F closure: the integral scalar i sends the skew i to −1, which is not skew.
- F=F₀, where the corrected and original coefficient rings agree.

For Λ(k)=3^ceil(k/2)o_F, `ceil((k+2)/2)=ceil(k/2)+1` gives period 2. Duality relative to values in p_F gives the exponent `1−ceil(k/2)=ceil((1−k)/2)`, so Λ(k)^#=Λ(1−k). The field extension is unramified because X²+1 is irreducible modulo 3. This supplies a valid normalized unitary example, not a replacement coefficient ring for Λ.

New **E55** records the scalar wording in §2.1 p.8 of **both v1 and v2**, independently confirmed by RT finding /2 and freshly checked in text/images. It is scoped to those manuscripts, not the unread Inventiones original. It is classified as a scalar misprint affecting no downstream stated result: the paper already identifies A₋ as Lie G over F₀, and the p.15 exact sequence is inside A₋. The correction fixes the wording and planned API; it does not disprove exactness. The new serialized source finding awaits its own source-issue review; no verdict is fabricated.

`sourceVersions` now contains actual historical preprint readings plus these bounded fresh readings. Its former explicitly **unread** published entry is preserved as `source.unreadPublished` metadata, outside that reading list; otherwise the collector would falsely report a published reading. The original publication remains uncollated.

## /3: one disconnected cuspidality definition

Item **246** is now general for Q=𝒢(k₀), Q°=𝒢°(k₀): irreducible τ is cuspidal in Stevens's convention iff its restriction to Q° contains an irreducible connected-cuspidal constituent. Q° is the rational-point subgroup of the algebraic identity component, not an identity component of a discrete finite group.

The connected predicate is imported from **PAPER-FINTZEN-21/33**, also identified by item 10. Its exact finite-field/parabolic-invariants statement was read. The maximal self-dual-order specialization survives in `specializations`, including its complete former statement and J°_M notation. Both that intertwining application and Lemma 7.4/§§7.2–7.3 consumers are recorded in `uses`. Its API/tests check agreement in the connected case, tensoring with a character of a central C₂ component, and a noncuspidal constituent.

Item **306** is merged into 246 with its former name, statement, locator and note preserved in `mergedFrom`; a top-level merge record identifies the canonical ID. There were no other item references to 306 requiring redirection. Its redundant route entry is removed. This introduces neither a new finite-reductive roadmap nor a duplicate connected predicate.

## Reading, checks and limits

Fresh reading on 2 October 2026: v2 pp.8,15,20,43 in text and page images; v1 p.8 likewise. The two PDFs have SHA-256:

- [v2](https://arxiv.org/pdf/math/0607622v2): `b5b409260344f0d86fbe98bee2c046971a5e9042ab8174f199343d10b5857109`, matching the prior PDF.
- [v1](https://arxiv.org/pdf/math/0607622v1): `05282d80a07a8a01ab7e76b46a936fdddac41514466ae8b3a208d151411c59ca`; this is a PDF hash, distinct from the historical compressed-source hash.

The arXiv history still ends at v2. Historical later-paper corrections and all 54 prior source-issue reviews/searches are retained, not claimed freshly re-audited. The Inventiones original, Bushnell–Kutzko/Bla source interiors and later corrections were not freshly read for this repair. The upstream relative-obstruction description and pinned declarations were directly checked; their remaining interfaces are explicitly requested rather than claimed implemented.

Maintainer note: the read-only collation check now correctly reports `provenance="preprint"`, with four findings affecting stated results. Its existing `published_exists` regex does not recognize the catalogue's full journal name “Inventiones mathematicae” when the link is arXiv, so its exposure list omits this paper. That collector issue remains outside these three deliverables; the published original still needs collation.

Paper and three-file intake validators, sourceVersions validation and diff checks pass. Supplemental checks verify one route per missing item, preserved unrelated item/status/library evidence, canonical merge provenance, exact counts and unchanged prior reviews. The original extraction has no dependency-edge/prerequisite graph to certify; no new gap-free graph claim is made.

An independent exact-arithmetic diagnostic passed **22,982 assertions**: all 19,683 Heisenberg associativity triples, factor-set/coboundary identities, centre/commutator sets, relative cocycle identities/asymmetry, determinant-power descent, fixed-scalar closure and lattice period/duality exponents. The displayed proofs establish the general distinctions; these finite diagnostics are not Lean tests or proofs of the pending generic bridge.

Current counts: **302 items = 6 library + 8 planned + 288 missing**, three route sizes **280,2,6**, and **55 source findings**. Current reader tables and summary reflect the merge. Pins remain Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. No Lean deliverable, compilation, cache or language server is required or claimed.
